# Terraform lovers unite: write a Terraform module that creates the following resources in IAM;
# ○ A role, with no permissions, which can be assumed by users within the same account,
# ○ A policy, allowing users / entities to assume the above role,
# ○ A group, with the above policy attached,
# ○ A user belonging to the above group.
# ○ All four entities should have the same name, or be similarly named in some
# meaningful way given the context e.g. prod-ci-role, prod-ci-policy, prod-ci-group,
# prod-ci-user; or just prod-ci. Make the suffixes toggleable, if you like.

#Note, since this is just an example, this assumes that the terraform setup also would have credentials, providers,
# And it would also have encrypted secrets through sops or connect to Hashicorp vault

resource "aws_iam_role" "moria-balrog-role" {
  name               = "moria-balrog-role"
  description        = "A role for the beings of shadow and fire"
}

resource "aws_iam_policy" "moria-balrog-policy" {
  name        = "moria-balrog-policy"
  path        = "/"
  description = "A policy for a group of balrogs to assume a role. Perhaps in Dwarven Human Resources Department"
  policy      = file("${path.module}/policies/assume_role_policy.json")
}

resource "aws_iam_group" "moria-balrog-group" {
  name = "balrogs"
  path = var.group_path
}

resource "aws_iam_group_policy_attachment" "moria-balrog-policy-attachement" {
  group      = aws_iam_group.moria-balrog-group.name
  policy_arn = aws_iam_policy.moria-balrog-policy.arn
}

resource "aws_iam_user" "moria-balrog-user-gothmog" {
  name = "gothmog"
  path = var.group_path

  tags = {
    Name = "Gothmog - A ancient and mighty Balrog"
  }
}

resource "aws_iam_user_group_membership" "moria-balrog-membership-gothmog" {
  user = aws_iam_user.moria-balrog-user-gothmog.name

  groups = [
    aws_iam_group.moria-balrog-group.name,
  ]
}

