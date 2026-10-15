-- lfg_dungeon_template: 57 Heroic/Cataclysm/MoP-era dungeonId rows had position_x/y/z = 0,
-- meaning the LFG system had no real teleport point for them. Coordinates sourced from
-- n0social/project_legion's sql/09_lfg_dungeon_entrances.sql (verified build 25996/26972).
-- The 7 "Random ..." aggregator entries (300,301,434,462,463,493,641) are intentionally left
-- at 0,0,0 - they route to the specific chosen dungeon's own entry, not a fixed point.

UPDATE lfg_dungeon_template SET position_x=595.190002, position_y=-328.291992, position_z=113.143997 WHERE dungeonId=205;
UPDATE lfg_dungeon_template SET position_x=1807.489990, position_y=1275.989990, position_z=141.677002 WHERE dungeonId=210;
UPDATE lfg_dungeon_template SET position_x=1084.349976, position_y=1054.619995, position_z=225.000000 WHERE dungeonId=211;
UPDATE lfg_dungeon_template SET position_x=1225.810059, position_y=-164.371994, position_z=60.000000 WHERE dungeonId=212;
UPDATE lfg_dungeon_template SET position_x=1153.869995, position_y=816.262024, position_z=195.350006 WHERE dungeonId=213;
UPDATE lfg_dungeon_template SET position_x=-519.182007, position_y=-481.424011, position_z=16.000000 WHERE dungeonId=215;
UPDATE lfg_dungeon_template SET position_x=1896.959961, position_y=825.632019, position_z=185.000000 WHERE dungeonId=217;
UPDATE lfg_dungeon_template SET position_x=332.397003, position_y=-1110.699951, position_z=72.774399 WHERE dungeonId=219;
UPDATE lfg_dungeon_template SET position_x=1798.739990, position_y=803.857971, position_z=47.364700 WHERE dungeonId=221;
UPDATE lfg_dungeon_template SET position_x=184.843994, position_y=-6.531750, position_z=-10.000000 WHERE dungeonId=226;
UPDATE lfg_dungeon_template SET position_x=404.282013, position_y=53.538300, position_z=252.427994 WHERE dungeonId=241;
UPDATE lfg_dungeon_template SET position_x=136.729004, position_y=-90.446800, position_z=12.554300 WHERE dungeonId=242;
UPDATE lfg_dungeon_template SET position_x=790.564026, position_y=620.513977, position_z=411.937988 WHERE dungeonId=245;
UPDATE lfg_dungeon_template SET position_x=790.564026, position_y=620.513977, position_z=411.937988 WHERE dungeonId=249;
UPDATE lfg_dungeon_template SET position_x=4925.850098, position_y=2169.169922, position_z=649.000000 WHERE dungeonId=251;
UPDATE lfg_dungeon_template SET position_x=4925.850098, position_y=2169.169922, position_z=649.000000 WHERE dungeonId=252;
UPDATE lfg_dungeon_template SET position_x=464.421997, position_y=206.578003, position_z=528.710022 WHERE dungeonId=253;
UPDATE lfg_dungeon_template SET position_x=464.421997, position_y=206.578003, position_z=528.710022 WHERE dungeonId=254;
UPDATE lfg_dungeon_template SET position_x=-463.238007, position_y=804.914978, position_z=250.279999 WHERE dungeonId=302;
UPDATE lfg_dungeon_template SET position_x=215.264008, position_y=1143.699951, position_z=215.000000 WHERE dungeonId=303;
UPDATE lfg_dungeon_template SET position_x=-511.125000, position_y=-361.471985, position_z=268.766998 WHERE dungeonId=304;
UPDATE lfg_dungeon_template SET position_x=-464.188995, position_y=366.287994, position_z=97.692200 WHERE dungeonId=305;
UPDATE lfg_dungeon_template SET position_x=1221.910034, position_y=1175.650024, position_z=252.334000 WHERE dungeonId=307;
UPDATE lfg_dungeon_template SET position_x=-548.262024, position_y=-65.316002, position_z=515.000000 WHERE dungeonId=311;
UPDATE lfg_dungeon_template SET position_x=-10685.099609, position_y=-1307.530029, position_z=18.152300 WHERE dungeonId=312;
UPDATE lfg_dungeon_template SET position_x=-548.262024, position_y=-65.316002, position_z=515.000000 WHERE dungeonId=319;
UPDATE lfg_dungeon_template SET position_x=1221.910034, position_y=1175.650024, position_z=252.334000 WHERE dungeonId=320;
UPDATE lfg_dungeon_template SET position_x=-464.188995, position_y=366.287994, position_z=97.692200 WHERE dungeonId=321;
UPDATE lfg_dungeon_template SET position_x=-511.125000, position_y=-361.471985, position_z=268.766998 WHERE dungeonId=322;
UPDATE lfg_dungeon_template SET position_x=215.264008, position_y=1143.699951, position_z=215.000000 WHERE dungeonId=323;
UPDATE lfg_dungeon_template SET position_x=-463.238007, position_y=804.914978, position_z=250.279999 WHERE dungeonId=324;
UPDATE lfg_dungeon_template SET position_x=-10685.099609, position_y=-1307.530029, position_z=18.152300 WHERE dungeonId=325;
UPDATE lfg_dungeon_template SET position_x=-14.362800, position_y=-393.380005, position_z=64.560501 WHERE dungeonId=326;
UPDATE lfg_dungeon_template SET position_x=-232.000000, position_y=2102.866455, position_z=79.670288 WHERE dungeonId=327;
UPDATE lfg_dungeon_template SET position_x=-11916.700195, position_y=-1204.000000, position_z=95.000000 WHERE dungeonId=334;
UPDATE lfg_dungeon_template SET position_x=-80.145798, position_y=1345.640015, position_z=40.771099 WHERE dungeonId=340;
UPDATE lfg_dungeon_template SET position_x=-11975.000000, position_y=12259.400391, position_z=-38.000000 WHERE dungeonId=416;
UPDATE lfg_dungeon_template SET position_x=2937.290039, position_y=71.691002, position_z=5.000000 WHERE dungeonId=435;
UPDATE lfg_dungeon_template SET position_x=3217.270020, position_y=-4975.209961, position_z=191.557999 WHERE dungeonId=437;
UPDATE lfg_dungeon_template SET position_x=4042.360107, position_y=534.955017, position_z=51.102402 WHERE dungeonId=439;
UPDATE lfg_dungeon_template SET position_x=1059.927124, position_y=-2501.192627, position_z=174.713226 WHERE dungeonId=464;
UPDATE lfg_dungeon_template SET position_x=-730.598938, position_y=1260.902832, position_z=116.623817 WHERE dungeonId=465;
UPDATE lfg_dungeon_template SET position_x=3660.669922, position_y=3021.649902, position_z=804.661011 WHERE dungeonId=466;
UPDATE lfg_dungeon_template SET position_x=-4214.904785, position_y=-2519.496582, position_z=-28.407816 WHERE dungeonId=467;
UPDATE lfg_dungeon_template SET position_x=1059.927124, position_y=-2501.192627, position_z=174.713226 WHERE dungeonId=468;
UPDATE lfg_dungeon_template SET position_x=-730.598938, position_y=1260.902832, position_z=116.623817 WHERE dungeonId=469;
UPDATE lfg_dungeon_template SET position_x=3660.669922, position_y=3021.649902, position_z=804.661011 WHERE dungeonId=470;
UPDATE lfg_dungeon_template SET position_x=1163.530029, position_y=2304.000000, position_z=387.951996 WHERE dungeonId=471;
UPDATE lfg_dungeon_template SET position_x=261.308990, position_y=70.739601, position_z=113.490997 WHERE dungeonId=472;
UPDATE lfg_dungeon_template SET position_x=-4214.904785, position_y=-2519.496582, position_z=-28.407816 WHERE dungeonId=519;
UPDATE lfg_dungeon_template SET position_x=-1020.928772, position_y=-3159.866455, position_z=29.083405 WHERE dungeonId=526;
UPDATE lfg_dungeon_template SET position_x=-2080.166748, position_y=284.102448, position_z=422.161469 WHERE dungeonId=529;
UPDATE lfg_dungeon_template SET position_x=-2080.166748, position_y=284.102448, position_z=422.161469 WHERE dungeonId=530;
UPDATE lfg_dungeon_template SET position_x=1526.418457, position_y=5344.791504, position_z=176.209457 WHERE dungeonId=554;
UPDATE lfg_dungeon_template SET position_x=1526.418457, position_y=5344.791504, position_z=176.209457 WHERE dungeonId=630;
UPDATE lfg_dungeon_template SET position_x=1163.530029, position_y=2304.000000, position_z=387.951996 WHERE dungeonId=631;
UPDATE lfg_dungeon_template SET position_x=2019.862915, position_y=-5541.501953, position_z=-305.299988 WHERE dungeonId=716;
