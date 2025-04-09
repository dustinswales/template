# About template
This repository provides several infrastructure pieces that CCPP physics parameterization developers could adopt if/when they migrate to hosting their code within a submodule.

If you already have created a GitHub repository and want to build out the infrastructure, skip below to template descriptions.

If you need to create a new GitHub repository, you could do this within your personal GitHub account. HOWEVER, if/when the time comes to including these changes with the CCPP Physics repository, the Pull Request cannot point to your personal fork. For this reason we encourage you to create any new GitHub repositories under a supported organization (e.g. NCAR or ufs-community). 

_I can't speak to how host models outside the UWM operate, but in general the submodule needs to be hosted under a community recognized organization_

# Template #1: Working practices and Governance 
The most important piece of information for your repository to contain is how the repository is managed. This should be visible and clearly define how changes are, or are not, included into this codebase.
Within the [Wiki](https://github.com/dustinswales/template/wiki/Governance) of this repository there is a template for repository governance that you could customize for your application(s). 
You could include this information directly within your repositories main README.md file, or create a Wiki page as is done here.

The governance template would be incomplete without a testing component. The next two templates provide the initial infrastructure to setup a robust testing harness to support offline development. 

# Template #2: Offline Driver
Included within this repository is a simple Fortran driver that could be extended to call your parameterization offline.

tests/driver.F90     - Read in NetCDF file with scheme inputs, call scheme, output scheme output to NetCDF file.
tests/machine.F90    - Working precision* of the host.
tests/Makefile       - Makefile for driver.
scheme.F90           - Scheme file.
tests/input_data.nc  - Empty scheme input file.
*It is best practice for the host to contol the precision, not the physics, so it's best to preserve this distinction within the submodule.

#### To build the offline driver you will need a Fortran compiler and the NetCDF library. 
There is an example script (tests/setup_hera.csh) to illustrate how to do this on NOAA RDHPCS Hera.
- cd tests/
- make offline_driver
- ./offline_driver

Inputs to the offline driver are contained within tests/input_data.nc, **currently empty**.

Outputs from the offline driver will be written to tests/driver_data.nc, **currently empty**.

#### To adopt this driver template within your repository:
- Copy the contents of tests/ into your repository.
- Replace references to scheme.F90 with references to your scheme.

At this point the offline driver should build with your linked scheme file(s).

####To extend this driver template within your repository:

**NOTE:** This template does not come with any sample data to drive/validate your scheme. This is your responsibility to provide or create. 

Once you have sample data:
- Ingest scheme input data into offline driver.
    - To do this extend the read_sample_data() procedure to read in data needed to run your scheme.
- Write scheme output data to NetCDF file.
    - To do this extend the write_output() procedure to output data needed to validate your scheme.

Without any data to drive your scheme, as an initial step you could still connect your scheme to this driver to ensure that it builds. 
This will give you a green check mark (!) in the GitHub repository pase once you hook the driver up to CI (template #3).

# Template #3 Continuous Integration / Continuous Development (CI/CD)
Alternatively, one may want to run the offline driver automatically on GitHub servers every time a change is introduced (e.g. Pull Request), or more frequently (e.g. Push).
(Personally, I think it's vastly more efficient to do a "git push" to run my tests versus running the driver offline. I don't need to set up an environment, open another window to run the driver, etc...)

#### To adopt this CI template within your repository:
- Copy the .github/workflows/run_driver.yml file to your repository.

This file contains a workflow that will run the offline driver (template #2) on the GitHub servers.

#### To extend this CI template for your needs:
- The offline driver doesn't have a validation step, which could(should) be built into the CI workflow.
- Add step to compare scheme outputs to baselines*.

*If small enough, these baselines could be included in the repository, but large datasets should be stored externally. Same applies for the sample input data, tests/input_data.nc

# Other information
The CCPP SCM has an extensive testing harness to run via CI, and is an excellent reference to consult.
https://github.com/NCAR/ccpp-scm/tree/main/.github/workflows





