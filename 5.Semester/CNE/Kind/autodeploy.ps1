$ErrorActionPreference = "Stop"

function Wait-ForKubeResource {
    param (
        [string]$Kubeconfig,
        [string]$Namespace,
        [string]$Kind,
        [string]$Name
    )

    Write-Host "⏳ Warte auf $Kind '$Name' im Namespace '$Namespace'..."

    while ($true) {
        $status = kubectl --kubeconfig=$Kubeconfig get $Kind $Name -n $Namespace --no-headers -o custom-columns=":status.readyReplicas" 2>$null
        if ($status -match '^\d+$' -and [int]$status -ge 1) {
            Write-Host "✅ $Kind '$Name' ist bereit."
            break
        }
        Start-Sleep -Seconds 5
    }
}

function Wait-ForFile {
    param ([string]$Path)
    while (-not (Test-Path $Path)) {
        Write-Host "⏳ Warte auf Datei $Path..."
        Start-Sleep -Seconds 5
    }
}

Write-Host "📦 1. Erstelle KIND Cluster 'capi-mgmt'..."
kind create cluster --name capi-mgmt --config kind-cluster-with-extramounts.yaml

Write-Host "⏳ 2. Warte auf das KIND-Cluster (API verfügbar)..."
while (-not (kubectl get nodes 2>$null)) {
    Write-Host "   ➜ Cluster noch nicht bereit, warte..."
    Start-Sleep -Seconds 5
}

Write-Host "🚀 3. Initialisiere Cluster API (Core)..."
clusterctl init

Write-Host "⚙️ 4. Initialisiere Cluster API (Docker Provider)..."
clusterctl init --infrastructure docker

Write-Host "⏱️ 5. Warte auf capi-controller-manager Deployment..."
while (-not (kubectl get deployment capi-controller-manager -n capi-system 2>$null)) {
    Start-Sleep -Seconds 5
}
kubectl rollout status deployment/capi-controller-manager -n capi-system

Write-Host "🌱 6. Wende Workload-Cluster Definition an..."
kubectl apply -f simple-cluster.yaml

Write-Host "⏳ 7. Warte auf kubeconfig-workload Datei..."
Wait-ForFile -Path "./kubeconfig-workload"

Write-Host "📥 8. Füge Cilium Helm-Repo hinzu..."
helm repo add cilium https://helm.cilium.io
helm repo update

Write-Host "🛡️ 9. Installiere Cilium im Workload-Cluster..."
helm install cilium cilium/cilium --kubeconfig=kubeconfig-workload --namespace kube-system

Write-Host "⏱️ 10. Warte auf Cilium DaemonSet..."
while (-not (kubectl --kubeconfig=kubeconfig-workload -n kube-system get daemonset cilium 2>$null)) {
    Start-Sleep -Seconds 5
}
kubectl --kubeconfig=kubeconfig-workload -n kube-system rollout status daemonset cilium

Write-Host "🌐 11. Erstelle NGINX Deployment im Workload-Cluster..."
kubectl --kubeconfig=kubeconfig-workload create deployment nginx --image=nginx

Write-Host "✅ Setup abgeschlossen!"
