--#set delimiter !

begin atomic
declare changed_ smallint default 1;

while changed_ <> 0 do
    set changed_ = 0;

    for S as
        <query statement that finds quests, "swaps", with a donor/donation & recipient pair>

    do
        <update statement that fixes Loot with the swap 'S'>;

        set changed_ = 1;

    end for;
    -- handle each swap

end while;
-- loop until no changes remain to be done

end!
-- we're done

