#! bin/bash

GIT_LOG_ALIAS=();
GIT_LOG_ALIAS_CONTENT="";
GIT_LOG_ALIAS_PIECE="";

function start_oglog() {
    local MENU_CHOISE="";
    local EXIT=3;

    while [ "$MENU_CHOISE" != "$EXIT" ];
        do
            show_main_menu;
            read -p $'\nTell me what you want, what you realy realy want?\n' MENU_CHOISE;
            handle_main_menu_choice $MENU_CHOISE;
        done
}

function show_main_menu() {
    echo $'\nChoose your hero!\n';
    echo $'1. Add new git log alias';
    echo $'2. Take a hug!';
    echo $'3. Exit';
}

function handle_main_menu_choice() {
    local ALIAS_ADDING=1;
    local HUG=2;
    local EXIT=3;

    case $1 in
    $ALIAS_ADDING)
        build_git_log_alias;
        ;;
    $HUG)
        echo $'\nI HUG YOU <3!\n';
        ;;
    $EXIT)
        echo $'\nGood bye!\n'
    esac
}

function build_git_log_alias() {
    local MENU_CHOISE="";
    local EXIT=13;

    while [ "$MENU_CHOISE" != "$EXIT" ];
        do
            show_pieces_menu;
            read -p $'\nWhat you want to see in your git log?\n' MENU_CHOISE;
            handle_piece_choice $MENU_CHOISE;
        done
}

function show_pieces_menu() {
    echo $'\n1. Commit hash';
    echo $'2. Tree hash';
    echo $'3. Parent hash';
    echo $'4. Author name';
    echo $'5. Author email';
    echo $'6. Author date';
    echo $'7. Relative author date';
    echo $'8. Commiter name';
    echo $'9. Commiter email';
    echo $'10. Commiter date';
    echo $'11. Relative commiter date';
    echo $'12. Message';
    echo $'13. Back';
}

function handle_piece_choice() {
    local COMMIT_HASH=("1" "%h");
    local TREE_HASH=("2" "%t");
    local PARENT_HASH=("3" "%p");
    local AUTHOR_NAME=("4" "%an");
    local AUTHOR_EMAIL=("5" "%ae");
    local AUTHOR_DATE=("6" "%ad");
    local AUTHOR_RELATIVE_DATE=("7" "%ar");
    local COMMITER_NAME=("8" "%cn");
    local COMMITER_EMAIL=("9" "%ce");
    local COMMITER_DATE=("10" "%cd");
    local COMMITER_RELATIVE_DATE=("11" "%cr");
    local MESSAGE=("12" "%s");

    case $1 in
    ${COMMIT_HASH[0]})
        build_alias_piece ${COMMIT_HASH[1]};
        ;;
    ${TREE_HASH[0]})
        build_alias_piece ${TREE_HASH[1]};
        ;;
    ${PARENT_HASH[0]})
        build_alias_piece ${PARENT_HASH[1]};
        ;;
    ${AUTHOR_NAME[0]})
        build_alias_piece ${AUTHOR_NAME[1]};
        ;;
    ${AUTHOR_EMAIL[0]})
        build_alias_piece ${AUTHOR_EMAIL[1]};
        ;;
    ${AUTHOR_DATE[0]})
        build_alias_piece ${AUTHOR_DATE[1]};
        ;;
    ${AUTHOR_RELATIVE_DATE[0]})
        build_alias_piece ${AUTHOR_RELATIVE_DATE[1]};
        ;;
    ${COMMITER_NAME[0]})
        build_alias_piece ${COMMITER_NAME[1]};
        ;;
    ${COMMITER_EMAIL[0]})
        build_alias_piece ${COMMITER_EMAIL[1]};
        ;;
    ${COMMITER_DATE[0]})
        build_alias_piece ${COMMITER_DATE[1]};
        ;;
    ${COMMITER_RELATIVE_DATE[0]})
        build_alias_piece ${COMMITER_RELATIVE_DATE[1]};
        ;;
    ${MESSAGE[0]})
        build_alias_piece ${MESSAGE[1]};
        ;;
    esac
}

function build_alias_piece() {
    GIT_LOG_ALIAS_PIECE+="$1";

    show_color_menu

    GIT_LOG_ALIAS_PIECE="$(add_color_to_piece)$GIT_LOG_ALIAS_PIECE ";
    GIT_LOG_ALIAS_CONTENT+="$GIT_LOG_ALIAS_PIECE";
    GIT_LOG_ALIAS_PIECE=""
    echo "$GIT_LOG_ALIAS_CONTENT";
}

function add_color_to_piece() {
    read -p $'\nWhat color?\n' MENU_CHOISE;

    case $MENU_CHOISE in
    1)
        echo "%C(red)";
        ;;
    2)
        echo "%C(green)";
        ;;
    3)
        echo "%C(yellow)";
        ;;
    4)
        echo "%C(blue)";
        ;;
    5)
        echo "%C(cyan)";
        ;;
    6)
        echo "%C(magenta)";
        ;;
    7)
        echo "%C(white)";
        ;;
    esac
}

function show_color_menu() {
    local RESTORE="\033[0m";
    local RED=("\033[00;31m" "%C(red)");
    local GREEN=("\033[00;32m" "%C(green)");
    local YELLOW=("\033[00;33m" "%C(yellow)");
    local BLUE=("\033[00;34m" "%C(blue)");
    local CYAN=("\033[00;36m" "%C(cyan)");
    local MAGENTA=("\033[00;35m" "%C(magenta)");
    local WHITE=("\033[01;37m" "%C(white)");

    echo $'\n';
    echo -e "1. ${RED[0]}RED${RESTORE}";
    echo -e "2. ${GREEN[0]}GREEN${RESTORE}";
    echo -e "3. ${YELLOW[0]}YELLOW${RESTORE}";
    echo -e "4. ${BLUE[0]}BLUE${RESTORE}";
    echo -e "5. ${CYAN[0]}CYAN${RESTORE}";
    echo -e "6. ${MAGENTA[0]}MAGENTA${RESTORE}";
    echo -e "7. ${WHITE[0]}WHITE${RESTORE}";
    echo -e "${RESTORE}"
}

start_oglog;

unset GIT_LOG_ALIAS;
unset GIT_LOG_ALIAS_CONTENT;