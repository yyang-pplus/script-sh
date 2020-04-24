source ~/.bash_util.sh

IsProtected() {
    local BRANCH_NAME="$1"
    local PATTERN="(master)|$GIT_PROTECTED_BRANCH_PATTERN"

    ##
    # @reference    Bash test: what does “=~” do?
    #               https://unix.stackexchange.com/questions/340440/bash-test-what-does-do
    #
    # @note The string, to be matched, should be quoted.
    #       The regular expression pattern shouldn't be quoted.
    ##
    if [[ "$BRANCH_NAME" =~ $PATTERN ]]; then
        Error "Push to $CURRENT_UPSTREAM is restricted."
        return 0
    else
        return 1
    fi
}
