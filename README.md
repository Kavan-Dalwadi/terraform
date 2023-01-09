# Terraform Workspaces

## Terraform workspace
Workspace are alternative to reuseable-modules created in terraform. Your terraform state files will be saved in different workspaces.

see documentation [here](https://developer.hashicorp.com/terraform/language/state/workspaces)

```
To list current Workspaces
$ terraform workspace list

To create a new Workspace
$ terraform workspace new dev
$ terraform workspace new <workspace-name>

To switch between Workspaces
$ terraform workspace select dev

To delete a Workspace (all resources must be deleted first)
$ terraform workspace delete dev
$ terraform workspace delete <workspace-name>
```
