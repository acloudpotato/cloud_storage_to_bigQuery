data "template_file" "startup" {
  template = "${file("${path.module}/template/test.tpl")}"

}
