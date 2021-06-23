#!/usr/bin/env bash

################################################################################
################################################################################
########### Merge main/master into open Pr's @admiralawkbar ####################
################################################################################
################################################################################

##################################################################
# Debug Vars                                                     #
# Define these early, so we can use debug logging ASAP if needed #
##################################################################
ACTIONS_RUNNER_DEBUG="${ACTIONS_RUNNER_DEBUG:-false}" # Boolean to see even more info (debug)

##################################################################
# Log Vars                                                       #
# Define these early, so we can use debug logging ASAP if needed #
##################################################################
LOG_LEVEL="${LOG_LEVEL:-VERBOSE}"        # Default log level (VERBOSE, DEBUG, TRACE)

if [[ ${ACTIONS_RUNNER_DEBUG} == true ]]; then LOG_LEVEL="DEBUG"; fi
# Boolean to see trace logs
LOG_TRACE=$(if [[ ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_TRACE
# Boolean to see debug logs
LOG_DEBUG=$(if [[ ${LOG_LEVEL} == "DEBUG" || ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_DEBUG
# Boolean to see verbose logs (info function)
LOG_VERBOSE=$(if [[ ${LOG_LEVEL} == "VERBOSE" || ${LOG_LEVEL} == "DEBUG" || ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_VERBOSE
# Boolean to see notice logs
LOG_NOTICE=$(if [[ ${LOG_LEVEL} == "NOTICE" || ${LOG_LEVEL} == "VERBOSE" || ${LOG_LEVEL} == "DEBUG" || ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_NOTICE
# Boolean to see warn logs
LOG_WARN=$(if [[ ${LOG_LEVEL} == "WARN" || ${LOG_LEVEL} == "NOTICE" || ${LOG_LEVEL} == "VERBOSE" || ${LOG_LEVEL} == "DEBUG" || ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_WARN
# Boolean to see error logs
LOG_ERROR=$(if [[ ${LOG_LEVEL} == "ERROR" || ${LOG_LEVEL} == "WARN" || ${LOG_LEVEL} == "NOTICE" || ${LOG_LEVEL} == "VERBOSE" || ${LOG_LEVEL} == "DEBUG" || ${LOG_LEVEL} == "TRACE" ]]; then echo "true"; fi)
export LOG_ERROR

#########################
# Source Function Files #
#########################
# shellcheck source=/dev/null
source /action/lib/functions/log.sh # Source the function script(s)

###########
# GLOBALS #
###########
# shellcheck disable=SC2034  # Variable is referenced indirectly
SUPPRESS_POSSUM="${SUPPRESS_POSSUM:-false}"

################################################################################
########################## FUNCTIONS BELOW #####################################
################################################################################
################################################################################
#### Function Header ###########################################################
Header() {
  ###############################
  # Give them the possum action #
  ###############################
  if [[ "${SUPPRESS_POSSUM}" == "false" ]]; then
    /bin/bash /action/lib/functions/possum.sh
  fi
}
################################################################################
############################### MAIN ###########################################
################################################################################

##########
# Header #
##########
Header
