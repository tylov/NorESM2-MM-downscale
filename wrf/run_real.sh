#!/bin/bash
## Project account key and queue
#SBATCH --account=nn9280k 
## Wall time limit:
#SBATCH --time=10:00:0
## Job name
#SBATCH --job-name=realdomain01
## Number of nodes needed
#SBATCH --nodes=04
## Number of tasks to start on each node (max is 2 sockets x 16 cores =32)
#SBATCH --ntasks-per-node=64
## Number of sockets on each node (max is 2)
##SBATCH --sockets-per-node=2
## Number of cores per socket (max is 16)
##SBATCH --cores-per-socket=16
## Over ride default settings for islands and queues
##SBATCH --switches=4
## Do not restart simulation if queue fails
#SBATCH --no-requeue

## Recommended safety settings:
set -o errexit # Make bash exit on any error
set -o nounset # Treat unset variables as errors

## Software modules
module load netCDF-Fortran/4.5.3-iompi-2020b



## go to run directory 
cd /cluster/work/users/$USER/4NORWAY-WRF/wps

ulimit -s unlimited

## Run the application
mpirun real.exe >& real.log