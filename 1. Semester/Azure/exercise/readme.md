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

Firstly, create a new ressource group.

![create_ressource_group](ITCNE23/1.%20Semester/Azure/ressources/pictures/ressource_creation/create_ressource_group.png)

Inside this ressource group click create function app.
This is the shortcut way to create a new WebApp and will use the Ressource Group it is created from.

![create_function_app_inside_ressource_group](ITCNE23/1.%20Semester/Azure/ressources/pictures/ressource_creation/create_function_app_inside_ressource_group.png)

Be sure to check the ressource group nonetheless.
It has to be the one we previously created.

![select_correct_ressource_group](ITCNE23/1.%20Semester/Azure/ressources/pictures/ressource_creation/select_correct_ressource_group.png)

You also have to create a new App Service Plan, you can do this directly from here.

![create_new_app_service_plan](ITCNE23/1.%20Semester/Azure/ressources/pictures/ressource_creation/create_new_app_service_plan.png)

# With Azure CLI

Before you can do anything, you have to be logged in.
This is done interactively with this command:

    az login

Then, to create a ServiceGroup, issue this command. This creates a new ServiceGroup under the name "myResourceGroupCli".

    az group create -l eastus -n myResourceGroupCli

Next, inside this ServiceGroup create a new WebAppPlan with this command.

    az appservice plan create --name MarcoDennisCLI --resource-group myResourceGroupCli

Now, with the ressource-group and the App plan created, we can finally actually create the WebApp. It will have the name "MarcoDenniswebappCLI".

    az webapp create -g myResourceGroupCli -p MarcoDennisCLI -n MarcoDenniswebappCLI

# With Powershell CMDlets

To use this method, you to firstly install the Powershell Module.

    Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

Once you installed the module, you have to log in. So that the module uses your Azure account. This will open a Browser window, which connects the module to your Azure Account.

    Connect-AzAccount

With this command, you can create a Ressource Group.

    New-AzResourceGroup -Name ResourceGroupPowershell -Location "East US"

Inside the Ressource Group, you can now create a Ressource.

    New-AzResource -Location "East US" -Properties @{test="test"} -ResourceName MarcoDennisPowershell -ResourceType microsoft.web/sites -ResourceGroupName ResourceGroupPowershell -Force

