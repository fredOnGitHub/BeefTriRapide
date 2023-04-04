function affiche_jusqu_a(n, t)
    for i = 1, math.min(n, #t) do -- tableaux indexé à partir de 1
        io.write(t[i], " ")
    end
    print()
end
