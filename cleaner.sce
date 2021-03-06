// This file is released under the 3-clause BSD license. See COPYING-BSD.
// Generated by builder.sce: Please, do not edit this file

oldmode = mode();
oldlines = lines()(2);
lines(0);

function perform_clean()
    root_tlbx = get_absolute_file_path('cleaner.sce');

    if isfile(root_tlbx + '/macros/cleanmacros.sce') then
        exec(root_tlbx+'/macros/cleanmacros.sce');
    else
        if isdir(root_tlbx + "/macros/") then
            deletefile(root_tlbx + "/macros/lib");
            binfiles = findfiles(root_tlbx + "/macros/", "*.bin");
            if ~isempty(binfiles) then
                deletefile(root_tlbx + "/macros/" + binfiles);
            end
        end
    end

    if isfile(root_tlbx + "/src/cleaner_src.sce") then
        exec(root_tlbx + "/src/cleaner_src.sce");
        mdelete(root_tlbx + "/src/cleaner_src.sce");
     end

    if isfile(root_tlbx + "/sci_gateway/cleaner_gateway.sce") then
        exec(root_tlbx + "/sci_gateway/cleaner_gateway.sce");
        mdelete(root_tlbx + "/sci_gateway/cleaner_gateway.sce");
     end

    if isfile(root_tlbx + "/help/cleaner_help.sce") then
        exec(root_tlbx + "/help/cleaner_help.sce");
    else
        if isdir(root_tlbx + "/jar/") then
            rmdir(root_tlbx + "/jar/", "s");
        end
    end

    if isfile(root_tlbx + "/loader.sce") then
        mdelete(root_tlbx + "/loader.sce");
    end

    if isfile(root_tlbx + "/unloader.sce") then
        mdelete(root_tlbx + "/unloader.sce");
    end
endfunction

try
    perform_clean();
catch
    [errmsg, tmp, nline, func] = lasterror();
    msg = "%s: error on line #%d: ""%s""\n";
    msg = msprintf(msg, func, nline, errmsg);
    lines(oldlines);
    mode(oldmode);
    clear perform_clean oldlines oldmode tmp nline func errmsg;
    error(msg);
end

lines(oldlines)
mode(oldmode);
clear perform_clean oldlines oldmode;
