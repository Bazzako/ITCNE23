# Introduction
In this exercise, we had the instruction to create some Azure ressources.
We had to do it once over the "manual" way, meaning over the webinterface of Azure.
Once over the "Azure CLI" and once more over the "Powershell CMDlets".

For a more detailed instruction, revert to the original source [here.](https://gitlab.com/ch-tbz-wb/Stud/azure/-/blob/main/2_Unterrichtsressourcen/Auftraege/Ressource%20erstellen.md) 

We had some struggles along the way, because we couldn't use the given name. We then resorted to freestyle and created our own names.

We also had an additional manual which we used to guide us.
You can find it [here.](https://mattruma.com/cheat-sheet-azure-cli/)

# Manual Way

Over the manual it's rather simple, everything is clickable and leads you directly to the desired function.

![create_ressource_group](..\..\..\..\..\ITCNE23\ressources\pictures\ressource_creation\create_ressource_group.png)


# With Azure CLI

Firstly, to create a ServiceGroup, issue this command. This creates a new ServiceGroup under the name "myResourceGroupCli".

    az group create -l eastus -n myResourceGroupCli

Next, inside this ServiceGroup create a new WebAppPlan with this command.

    az appservice plan create --name MarcoDennisCLI --resource-group myResourceGroupCli

Now, with the ressource-group and the App plan created, we can finally actually create the WebApp. It will have the name "MarcoDenniswebappCLI".

    az webapp create -g myResourceGroupCli -p MarcoDennisCLI -n MarcoDenniswebappCLI

# With Powershell CMDlets



