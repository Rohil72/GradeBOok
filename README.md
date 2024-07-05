the secrets file doesnt have a key like it has a project id.
the project can struggke at times unless run locally as in my case i got too many request as a error multiple times.
it uses vanilla js but is compatable to express
contracts/GradeBook.sol: Solidity smart contract for managing student grades.
contracts/Migrations.sol: Solidity contract to handle migrations (required by Truffle).
migrations/1_initial_migration.js: Script to deploy the Migrations contract.
migrations/2_deploy_contracts.js: Script to deploy the GradeBook contract.
truffle-config.js: Truffle configuration file with network and compiler settings.
frontend/index.html: HTML file for the frontend interface.
frontend/app.js: JavaScript file to interact with the smart contract using Ethers.js.
.env: Environment file (not to be committed) with mnemonic and Infura project ID.
package.json: Node.js package configuration file with dependencies.
README.md: Documentation file with setup and usage instructions.
.gitignore: Git ignore file to exclude unnecessary files from the repository.
