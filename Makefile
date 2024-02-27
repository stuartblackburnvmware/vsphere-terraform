default:
	echo "No default action"

plan:
	@terraform plan -out build_plan -parallelism=20

apply:
	@terraform apply build_plan
	@rm -f build_plan