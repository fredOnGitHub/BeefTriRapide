function ouvre_fichier(nom_fichier)
    return io.open(nom_fichier)
end

function fichier_en_tab_de_number(nom_fichier)
    io.write("fichier_en_tab ", nom_fichier, "\n")
    file = ouvre_fichier(nom_fichier)
    str = file:read("*all")
    t = {}
    for s in str:gmatch("[^\r\n]+") do
        table.insert(t, s)
    end

    -- les strings en number
    r = {}
    for key, value in pairs(t) do

        r[key] = tonumber(value)
    end
    return r
end
