package testing

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

var awsRegion = "us-west-2"

func TestSSMName(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples",
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}
	// Make sure testing infrastructure removed at last
	defer terraform.Destroy(t, terraformOptions)
	// Do terraform init and terraform apply --auto-approve
	terraform.InitAndApply(t, terraformOptions)
	// Get output variable as actual name
	actualName := terraform.Output(t, terraformOptions, "name")
	// Set expected name to be compared
	expectedName := []string{"/pay/paytest/stg/name1", "/pay/paytest/stg/name2"}
	assert.Equal(t, strings.Join(expectedName, ",\n"), actualName)
}
