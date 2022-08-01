aws_dynamodb_table_item.example will be created
  + resource "aws_dynamodb_table_item" "example" {
      + hash_key   = "exampleHashKey"
      + id         = (known after apply)
      + item       = jsonencode(
            {
              + exampleHashKey = {
                  + S = "something"
                }
              + four           = {
                  + N = "44444"
                }
              + one            = {
                  + N = "11111"
                }
              + three          = {
                  + N = "33333"
                }
              + two            = {
                  + N = "22222"
                }
            }
        )
      + table_name = "example-name"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes 

aws_dynamodb_table_item.example: Creating...
aws_dynamodb_table_item.example: Creation complete after 0s [id=example-name|exampleHashKey||something|]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
bash-5.0$ terraform graph
digraph {
        compound = "true"
        newrank = "true"
        subgraph "root" {
                "[root] aws_dynamodb_table.example (expand)" [label = "aws_dynamodb_table.example", shape = "box"]
                "[root] aws_dynamodb_table_item.example (expand)" [label = "aws_dynamodb_table_item.example", shape = "box"]
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"]" [label = "provider[\"registry.terraform.io/hashicorp/aws\"]", shape = "diamond"]
                "[root] aws_dynamodb_table.example (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
                "[root] aws_dynamodb_table_item.example (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] aws_dynamodb_table.example (expand)"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] aws_dynamodb_table_item.example (expand)"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_dynamodb_table.example (expand)"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_dynamodb_table_item.example (expand)"
                "[root] root" -> "[root] meta.count-boundary (EachMode fixup)"
                "[root] root" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)"
        }
