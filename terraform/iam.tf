data "aws_iam_policy_document" "automation_drone_assumerole_policy_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.profile}:root",
      ]
    }
  }
}

resource "aws_iam_role" "automation_drone_role" {
  name               = "automation-drone"
  description        = "automation-drone role used only by CI/CD pipeline"
  assume_role_policy = data.aws_iam_policy_document.automation_drone_assumerole_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "automation-drone-admin-access" {
  depends_on = ["aws_iam_role.automation_drone_role"]

  role       = aws_iam_role.automation_drone_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
