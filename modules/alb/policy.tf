# Busca a política oficial e atualizada diretamente da AWS via HTTP
data "http" "lb_controller_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
}

resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.project_name}-controller-policy"
  policy = data.http.lb_controller_policy.response_body # Usa o conteúdo baixado da internet

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-controller-policy"
    }
  )
}