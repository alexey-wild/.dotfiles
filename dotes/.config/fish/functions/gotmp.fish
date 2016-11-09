function gotmp --description "Go to new tmp folder"
    cd (mktemp -d "/tmp/workspace.XXXXX");
end