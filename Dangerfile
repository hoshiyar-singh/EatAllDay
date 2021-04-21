# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
# declared_trivial = github.pr_title.include? "#trivial"

# PR is a work in progress and shouldn't be merged yet
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn "Big PR, consider splitting into smaller ones" if git.lines_of_code > 500

# Fail when there is a huge PR
fail "Big PR, split it into smaller ones" if git.lines_of_code > 750

# Warn if there is a big diff between additions and deletions
warn "Big PR Diff, consider splitting it into smaller ones" if (git.insertions - git .deletions) > 350

# Fail if there is a huge diff between additions and deletions
fail "Big PR Diff, split it into smaller ones" if (git.insertions - git .deletions) > 500

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail "Please rebase to get rid of the merge commits in this PR"
end

# Mainly to encourage writing up some reasoning about the PR, rather than
# just leaving a title
if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

# If these are all empty something has gone wrong, better to raise it in a comment
if git.modified_files.empty? && git.added_files.empty? && git.deleted_files.empty?
  fail "This PR has no changes at all, this is likely an issue during development."
end

podfile_updated = !git.modified_files.grep(/Podfile/).empty?

# Leave warning, if Podfile changes
if podfile_updated
  warn "The `Podfile` was updated"
end

# This is swiftlint plugin. More info: https://github.com/ashfurrow/danger-swiftlint
#
# This lints all Swift files and leave comments in PR if
# there is any issue with linting
swiftlint.lint_files inline_mode: true
swiftlint.lint_files fail_on_error: true
swiftlint.lint_all_files = true

# Don't let testing shortcuts get into master by accident
# these checks are related to Quick unit testing framework
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

# Future rules

# has_app_changes = !git.modified_files.grep(/ProjectName/).empty?
# has_test_changes = !git.modified_files.grep(/ProjectNameTests/).empty?
#
# # If changes are more than 10 lines of code, tests need to be updated too
# if has_app_changes && !has_test_changes && git.lines_of_code > 10
#   fail("Tests were not updated", sticky: false)
# end
