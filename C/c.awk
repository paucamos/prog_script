BEGIN {
    FS=";"
    counterH = 0
    counterD = 0
} 
{
    # Contador de homes i dones
    if ($2 == "Male") {
        counterH ++
    } else {
        counterD ++
    }
}
END {
    printf "Hi ha %s homes", counterH
    print ""
    printf "I %s dones", counterD
    print ""
}