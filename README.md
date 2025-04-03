# Description
Template repository with governance and continuous integration

# Governance for [] development
This document describes the governance structure and working practices of the [] repository. Outlined below are the steps that developers should follow if they want to make contributions to this repository. 

# Communicate with us early
All proposed changes should be discussed with the primary developer(s) before introducing any code modifications. Please open a GitHub issue as early as possible, preferably when you are planning a change. This issue should clearly describe the purpose and scope of the change.

# Create Fork and Branch
Prior to beginning the development, you will need to create a fork of the [] repository. You can find information here on how to fork a repository on GitHub. Once you have created a forked copy, then you can create a branch to gather your development. 

# Developing 
This repository contains a host-model agnostic physics parameterization for [], which is shared across several hosts and applications. Any changes introduced here could have an impact on any host/application that relies on this software. For this reason it is suggested that any host-specific changes should be introduced with backward compatibility (e.g. does not break the existing interface). For example, host or application specific parametric changes should be implemented as optional scheme arguments, which are assigned when present or revert to the original values when not. New features could also be added similarly in a backward compatible manner.

# Testing
Included in the [] repository is an offline driver that runs a set of regression tests to ensure that any developments being introduced will not break existing functionality, or unintentionally change the answers. These tests are also included in GitHub workflows and will be run automatically whenever a GitHub Pull Request (PR)is opened into the authoritative [] repository. To run these tests manually, please see the instructions in the driver/ directory.

Another way to run the regression tests is by creating a “mock PR” in your personal fork from your development branch into the main branch. Once you do this, every time you “push” changes to your fork, the tests will run and the results will be documented in your “mock PR”

We encourage developers to run these tests often during their development process. 

# Code Review
Once all tests are passing, or if changes in the results are expected, please open a PR from your fork and branch into the authoritative [] repository. This will notify the developer(s) and any associated CODEOWNERS that the work is ready for review. When opening the PR, please be sure to fill in the PR template with as much detail as possible. 

If the PR introduces changes to the results, please be sure to include a detailed explanation of why these changes should be accepted. Including plots and figures within the PR is strongly recommended.

After the PR has been discussed, reviewed and all tests are as expected, it will be merged into the main branch. At this point the GitHub Issue detailing the work could be closed.
