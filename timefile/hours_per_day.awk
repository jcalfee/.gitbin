/MANUAL/{
    minutes=substr($2,7);
    cmd="date -d "$1" '+%D    %A'"
    cmd | getline result
    close(cmd)
    total_minutes[result]+=minutes
}
/AUTO/{
    minutes=substr($2,5);
    cmd="date -d "$1" '+%D'"
    cmd | getline result
    close(cmd)
    if(minutes+0 <= 20)
        total_minutes[result]+=minutes
}
END{
    for (day in total_minutes)
        printf day"\t%05.2f\n", (total_minutes[day]/60)
}
