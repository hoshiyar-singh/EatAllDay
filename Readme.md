<h1>Delivery Hero iOS repository template</h1>

### Current items

Everything is self explanatory ☺️

- .github/CODEOWNERS
- .gitignore
- .swiftformat
- .swiftlint.yml
- .travis.yml
- Cartfile
- Dangerfile
- Gemfile
- bootstrap.sh
- fastlane/Appfile
- fastlane/Fastfile
- fastlane/README.md

### Workflows

This template contain three basic workflows those will run on Pull resuests.

 1. .github/workflows/add_default_assignee.yml
   This workflow will add the PR owner as its assignee if no assigne is specified.
2. .github/workflows/add_default_label.yml
  This workflow will add a label `READY FOR REVIEW` if no labels specified while creating a PR
3. .github/workflows/change_label_on_review.yml
  This workflow will do two checks once a PR is reviewed.
  1. On first approving review add `ONE MORE REVIEW` label and remove  `READY FOR REVIEW` 
  2. on Next approving reviews, if no pending change request, add a label `CODE REVIEWED` and remove `ONE MORE REVIEW`
Note: Allo of these label names are placeholders, you may update those if you wish.

**After creating the Repo using this template, you need to add the ssh key and DANGER_GITHUB_API_TOKEN on travis settings**

###  Todo
- Create script to Generate xcode project from command line with command line inputs for
	- Project name
	- Bundle identifier
	- Project type, framework/app
	- minimum iOS version
	- Supported platform
	- Using these inputs we can generate a yaml file which can be passed to [XcodeGen](https://github.com/yonaskolb/XcodeGen) tool to generate project.
