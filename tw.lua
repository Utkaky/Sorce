-- Deobfuscated by LeakD | discord.gg/qteAQmfJmP

local Env = getfenv();
local w = {};
local v1 = {...};
local r1 = true;
local r2 = string.gmatch;
local function r3(...)
    error("Tamper Detected!");
    return; 
end;
local r4 = false;
local v2 = pcall(function(...)
    r4 = true;
    return; 
end);
local v3 = v2;
if v2 then
    v3 = r4;
end;
local v4 = 1;
local r5 = math.random;
local v5 = table.concat;
local function v6(...)
    while true do
        l1 = l2;
        l2 = l1;
        r3(); 
    end;
    return; 
end;
local r6 = table and table.unpack or unpack;
local r7 = r5(3, 65);
local v7 = {
    pcall(function(...)
        return "vkMk" / (6385096 - "jqa1" ^ 13397361); 
    end)
};
local v8 = v7[2];
local r8 = tonumber(r2(tostring(v8), ":(%d*):")());
for l = 1, r7 do
    r9 = l;
    r10 = math.random(1, 100);
    r11 = r5(0, 255);
    r12 = r5(1, r10);
    r13 = r5(1, 2) == 1;
    r14 = v8.gsub(v8, ":(%d*):", ":" .. tostring(r5(0, 10000)) .. ":");
    I = {
        pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "fH0y" / (3257347 - "6aH1RaPc4" ^ 11102091); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for O = 1, r10 do
                v1[O] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end)
    };
    if r13 then
        r1 = r1 and (pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "fH0y" / (3257347 - "6aH1RaPc4" ^ 11102091); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for O = 1, r10 do
                v1[O] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end) == false and I[2] == r14);
    end; 
end;
r1 = r1 and 0 == 0;
if r1 then
    r17 = math.floor;
    v7 = {};
    r18 = 0;
    r19 = 2;
    r20 = {};
    i = 0;
    for e = 1, 256 do
        v7[e] = e; 
    end;
    v8 = #v7 == 0;
    e = table.remove(v7, math.random(1, #v7));
    r20[e] = string.char(e - 1);
    if #v7 == 0 then
        r21 = {};
        r23 = {};
        r16 = setmetatable({}, {
            ["__index"] = r23,
            ["__metatable"] = nil
        });
        return (function(...)
            v1 = {
                f(1, S(C))
            };
            r24 = print;
            r25 = error;
            r26 = setmetatable;
            r27 = rawset;
            r28 = rawget;
            r29 = pairs;
            r30 = newproxy;
            r31 = getmetatable;
            r32 = typeof;
            r33 = assert;
            r34 = tostring;
            v7 = bit32;
            r35 = v7.bxor;
            r36 = v7.rrotate;
            l = v7.band;
            F = v7.bor;
            m = v7.lshift;
            H = v7.rshift;
            n = v7.lrotate;
            p = v7.bxor;
            X = v7.rrotate;
            r37 = os.clock;
            r38 = os.time;
            r39 = string.format;
            r40 = string.sub;
            sc = string.pack;
            r41 = buffer.copy;
            r42 = buffer.fill;
            r43 = buffer.create;
            r44 = buffer.fromstring;
            r45 = buffer.len;
            r46 = buffer.readu8;
            r47 = buffer.readu16;
            r48 = buffer.readu32;
            r49 = buffer.tostring;
            r50 = buffer.writestring;
            r51 = buffer.writeu8;
            r52 = buffer.writeu16;
            r53 = buffer.writeu32;
            r54 = math.floor;
            r55 = math.random;
            v5 = getfenv;
            Wc = _VERSION;
            v5();
            Dc = "Lune\x00";
            xc = Wc.find(Wc, Dc.gsub(Dc, "\x00", ""));
            if xc then
                Ac = "\x00Lune";
            end;
            Ac = xc or "Luau";
            r56 = request;
            r57 = gethwid or function(...)
                 
            end;
            local function Dc(...)
                v1 = {
                    f(1, S(C))
                };
                while true do end;
                return; 
            end;
            r58 = r37();
            local function r59(arg1_2, ...)
                local c = {
                    115,
                    c[1],
                    c[2]
                };
                v1 = arg1_2;
                w[c[1]]("[" .. v1 .. "]: Crashed");
                writefile("crash.log", "[" .. v1 .. "]: Crashed");
                return; 
            end;
            local function r60(...)
                v1 = {
                    f(1, S(C))
                };
                r59(0);
                while true do end;
                return; 
            end;
            local function r61(...)
                r59(16);
                v1 = {
                    f(1, S(C))
                };
                while true do end;
                return; 
            end;
            local function r62(...)
                local c = {
                    167,
                    115
                };
                if not w[c[1]] then
                    w[c[2]](select(-1, ...));
                end;
                return; 
            end;
            v5 = 0 + 4.5;
            Tc = v5;
            local function r63(arg1_3, ...)
                local c = {
                    c[1],
                    c[2],
                    142,
                    163
                };
                U = {
                    f(2, S(C))
                };
                O = w[c[1]];
                E = w[c[2]];
                if arg1_3 == "table" then
                    O = {};
                    E = w[c[3]](2, 10);
                    if E < 2 and E > 10 then
                        w[vc](1);
                        while true do end;
                    end;
                    for r = 1, w[c[3]](2, 10) do
                        O[tostring({}) .. w[c[3]](1000000, 2000000)] = tostring({}) .. w[c[3]](1000000, 2000000); 
                    end;
                    return O;
                end;
                v1 = "table";
                return __JUNK_CODE__("table", __JUNK_CODE__("table")); 
            end;
            local function qc(arg1_4, ...)
                r64 = arg1_4;
                return not pcall(function(...)
                    local c = {
                        16
                    };
                    setfenv(w[c[1]], getfenv(w[c[1]]));
                    return; 
                end); 
            end;
            local function Gc(arg1_5, ...)
                local c = {
                    c[1],
                    c[2]
                };
                for U = 1, 198 do
                    coroutine.wrap(arg1_5); 
                end;
                E = {
                    pcall(arg1_5)
                };
                G = not E[1];
                if G then
                    E = string.find(E[2], "C stack overflow");
                end;
                if G then
                    return true;
                end;
                return false; 
            end;
            local function r65(arg1_6, ...)
                r66 = 0;
                local function r67(arg1_7, ...)
                    v1 = arg1_7;
                    return function(arg1_8, ...)
                        return arg1_8; 
                    end; 
                end;
                return (function(arg1_9, ...)
                    local c = {
                        3,
                        4
                    };
                    v1 = arg1_9;
                    w[c[1]] = w[c[1]] + 1;
                    if w[c[1]] == 82 then
                        w[c[1]] = 0;
                        return v1;
                    end;
                    return w[c[2]](function(arg1_10, ...)
                        return arg1_10; 
                    end)(v1); 
                end)(arg1_6); 
            end;
            local function r68(arg1_11, ...)
                local c = {
                    c[1],
                    c[2]
                };
                r69 = 0;
                local function r70(arg1_12, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    r71 = arg1_12;
                    return {
                        ["__index"] = function(...)
                            return r71; 
                        end
                    }; 
                end;
                return (function(arg1_13, ...)
                    local c = {
                        1,
                        2,
                        c[1],
                        c[2]
                    };
                    r72 = arg1_13;
                    w[c[1]] = w[c[1]] + 1;
                    if w[c[1]] == 82 then
                        w[c[1]] = 0;
                        return r72;
                    end;
                    return w[c[2]]({
                        ["__index"] = function(...)
                            return r72; 
                        end
                    }).__index(); 
                end)(arg1_11); 
            end;
            r73 = 0;
            xpcall(tostring, function(...)
                local c = {
                    166
                };
                w[c[1]] = w[c[1]] + 1;
                return; 
            end);
            xpcall(r26, function(...)
                local c = {
                    166
                };
                w[c[1]] = w[c[1]] + 1;
                return; 
            end);
            xpcall(setfenv, function(...)
                local c = {
                    166
                };
                w[c[1]] = w[c[1]] + 1;
                return; 
            end);
            xpcall(buffer.tostring, function(...)
                local c = {
                    166
                };
                w[c[1]] = w[c[1]] + 1;
                return; 
            end);
            if r73 ~= 4 then
                r59(2);
                while true do end;
            end;
            Tc = Tc + 5.5;
            Tc = Tc + 123;
            r74 = {
                ["cache"] = {},
                ["load"] = function(arg1_14, ...)
                    local c = {
                        28,
                        c[1],
                        c[2]
                    };
                    v1 = arg1_14;
                    if not w[c[1]].cache[v1] then
                        w[c[1]].cache[v1] = {
                            ["c"] = w[c[1]][v1]()
                        };
                    end;
                    return w[c[1]].cache[v1].c; 
                end
            };
            r74.v1 = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                return {
                    ["\x00generateSeed"] = function(...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        return (os.time() * 1664525 + os.clock() + math.floor(math.random() * 1000000)) % 4294967296; 
                    end,
                    ["\x00lcg"] = function(arg1_15, arg2_15, arg3_15, arg4_15, ...)
                        O = arg3_15;
                        G = {};
                        b = arg2_15;
                        v6 = 4294967296;
                        d = arg1_15;
                        for i = 1, b do
                            G[i] = O + (1664525 * v1 + 1013904223) % v6 % (arg4_15 - O + 1); 
                        end;
                        return G; 
                    end,
                    ["\x00sign"] = function(arg1_16, arg2_16, ...)
                        return arg1_16 + (#arg2_16 % 1000) ^ 2; 
                    end
                }; 
            end;
            r74.b = function(...)
                local c = {
                    c[1],
                    c[2],
                    130,
                    132,
                    113,
                    140,
                    122,
                    135,
                    128,
                    129,
                    133,
                    111,
                    137,
                    123,
                    134,
                    141,
                    138,
                    139,
                    121,
                    136,
                    127,
                    120,
                    119,
                    131,
                    114
                };
                return {
                    ["\x00AES"] = function(arg1_17, ...)
                        local c = {
                            c[3],
                            c[1],
                            c[2],
                            c[4],
                            c[5],
                            c[6],
                            c[7],
                            c[8],
                            c[9],
                            c[10],
                            c[11],
                            c[12],
                            c[13],
                            c[14],
                            c[15],
                            c[16],
                            c[17],
                            c[18],
                            c[19],
                            c[20],
                            c[21],
                            c[22],
                            c[23],
                            c[24]
                        };
                        r75 = w[c[1]](131072);
                        r76 = w[c[1]](65536);
                        r77 = w[c[1]](65536);
                        r78 = w[c[1]](65536);
                        r79 = w[c[1]](65536);
                        r80 = w[c[1]](65536);
                        r81 = {
                            ["FwdMode"] = function(arg1_18, arg2_18, arg3_18, arg4_18, arg5_18, arg6_18, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[6],
                                    c[7],
                                    c[8]
                                };
                                G = arg5_18;
                                U = arg2_18;
                                E = arg4_18;
                                v1 = arg1_18;
                                v4 = arg6_18;
                                w[c[2]]((w[c[1]](arg3_18) - 16) % 16 == 0, "Input length must be a multiple of 16 bytes");
                                if v4 then
                                    v4 = v4;
                                    w[c[2]](w[c[1]](v4) == 16, "Initialization vector must be 16 bytes long");
                                    w[c[6]](E, 0, w[c[7]](w[c[8]](O, 0), w[c[8]](v4, 0)));
                                    w[c[6]](E, 4, w[c[7]](w[c[8]](O, 4), w[c[8]](v4, 4)));
                                    w[c[6]](E, 8, w[c[7]](w[c[8]](O, 8), w[c[8]](v4, 8)));
                                    w[c[6]](E, 12, w[c[7]](w[c[8]](O, 12), w[c[8]](v4, 12)));
                                    arg1_18(E, 0, E, 0);
                                    for b = 16, w[c[1]](O) - 16, 16 do
                                        w[c[6]](E, b, w[c[7]](w[c[8]](O, b), w[c[8]](E, b - 16)));
                                        w[c[6]](E, b + 4, w[c[7]](w[c[8]](O, b + 4), w[c[8]](E, b - 12)));
                                        w[c[6]](E, b + 8, w[c[7]](w[c[8]](O, b + 8), w[c[8]](E, b - 8)));
                                        w[c[6]](E, b + 12, w[c[7]](w[c[8]](O, b + 12), w[c[8]](E, b - 4)));
                                        arg1_18(E, b, E, b); 
                                    end;
                                    return;
                                else
                                    w[c[5]](16);
                                end; 
                            end,
                            ["InvMode"] = function(arg1_19, arg2_19, arg3_19, arg4_19, arg5_19, arg6_19, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[8],
                                    c[6],
                                    c[7]
                                };
                                v4 = arg6_19;
                                G = arg5_19;
                                v1 = arg1_19;
                                E = arg4_19;
                                U = arg2_19;
                                w[c[2]]((w[c[1]](arg3_19) - 16) % 16 == 0, "Input length must be a multiple of 16 bytes");
                                if v4 then
                                    v4 = v4;
                                    w[c[2]](w[c[1]](v4) == 16, "Initialization vector must be 16 bytes long");
                                    w[c[6]](O, 0);
                                    w[c[6]](O, 4);
                                    w[c[6]](O, 8);
                                    w[c[6]](O, 12);
                                    arg2_19(O, 0, E, 0);
                                    w[c[7]](E, 0, w[c[8]](w[c[6]](E, 0), w[c[6]](v4, 0)));
                                    w[c[7]](E, 4, w[c[8]](w[c[6]](E, 4), w[c[6]](v4, 4)));
                                    w[c[7]](E, 8, w[c[8]](w[c[6]](E, 8), w[c[6]](v4, 8)));
                                    v5 = w[c[7]];
                                    v5(E, 12, w[c[8]](w[c[6]](E, 12), w[c[6]](v4, 12)));
                                    for u = 16, w[c[1]](O) - 16, 16 do
                                        e = w[c[6]](O, u);
                                        M = w[c[6]](O, u + 4);
                                        v7 = w[c[6]](O, u + 8);
                                        arg2_19(O, u, E, u);
                                        v8 = w[c[6]](O, u + 12);
                                        w[c[7]](E, u, w[c[8]](w[c[6]](E, u), w[c[6]](O, 0)));
                                        w[c[7]](E, u + 4, w[c[8]](w[c[6]](E, u + 4), w[c[6]](O, 4)));
                                        w[c[7]](E, u + 8, w[c[8]](w[c[6]](E, u + 8), w[c[6]](O, 8)));
                                        w[c[7]](E, u + 12, w[c[8]](w[c[6]](E, u + 12), w[c[6]](O, 12)));
                                        cc = w[c[6]](O, u + 12);
                                        I = w[c[6]](O, u + 8);
                                        v5 = w[c[6]](O, u);
                                        v6 = w[c[6]](O, u);
                                        P = w[c[6]](O, u + 4);
                                        i = w[c[6]](O, u + 12);
                                        b = w[c[6]](O, u + 8);
                                        d = w[c[6]](O, u + 4); 
                                    end;
                                    return;
                                else
                                    w[c[5]](16);
                                end; 
                            end
                        };
                        r82 = {
                            ["Pad"] = function(arg1_20, arg2_20, arg3_20, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[9],
                                    c[10]
                                };
                                O = arg3_20;
                                v1 = arg1_20;
                                E = w[c[1]](v1);
                                U = arg2_20;
                                if U then
                                    w[c[2]](w[c[1]](U) >= E + O, "Output buffer out of bounds");
                                else
                                    U = w[c[5]](E - E % O + O);
                                end;
                                v4 = O - E % O;
                                w[c[6]](U, 0, v1, 0, E);
                                w[c[7]](U, E, v4, v4);
                                return U; 
                            end,
                            ["Unpad"] = function(arg1_21, arg2_21, arg3_21, ...)
                                local c = {
                                    c[4],
                                    c[11],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[12],
                                    c[1],
                                    c[9]
                                };
                                U = arg2_21;
                                v1 = arg1_21;
                                E = w[c[1]](v1);
                                G = w[c[2]](v1, E - 1);
                                v4 = E - G;
                                b = w[c[5]];
                                v2 = 2;
                                v2 = w[c[3]](0 < G and G <= arg3_21, "Got unexpected padding");
                                v6 = 1;
                                v3 = 0;
                                for v3 = E, v2, v2 do
                                    i = w[c[5]];
                                    v3 = w[c[2]];
                                    if v3(v1, i) ~= G then
                                        w[c[6]]("Got unexpected padding");
                                    end; 
                                end;
                                if U then
                                    w[c[3]](w[c[1]](U) >= v4, "Output buffer out of bounds");
                                else
                                    U = w[c[7]](v4);
                                end;
                                w[c[8]](U, 0, v1, 0, v4);
                                return U; 
                            end,
                            ["Overwrite"] = nil
                        };
                        local function r83(arg1_22, arg2_22, arg3_22, arg4_22, ...)
                            local c = {
                                c[9],
                                c[13],
                                c[14],
                                c[8],
                                c[7],
                                c[15],
                                215,
                                c[16],
                                c[6]
                            };
                            O = arg3_22;
                            U = arg2_22;
                            v1 = arg1_22;
                            if arg4_22 then
                                w[c[1]](O, 0, v1, 0, U);
                            else
                                w[c[2]](O, 0, v1, U);
                            end;
                            G = w[c[3]](w[c[4]](O, U - 4), 8);
                            v4 = 0.5;
                            if U == 32 then
                                for o = 32, 192, 32 do
                                    G = w[c[5]](w[c[4]](O, v2 - 32), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 0.5 * 2 % 229);
                                    w[c[9]](O, v2, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 28), G);
                                    w[c[9]](O, v2 + 4, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 24), G);
                                    w[c[9]](O, v2 + 8, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 20), G);
                                    w[c[9]](O, v2 + 12, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 16), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2));
                                    w[c[9]](O, v2 + 16, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 12), G);
                                    w[c[9]](O, v2 + 20, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 8), G);
                                    w[c[9]](O, v2 + 24, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 4), G);
                                    w[c[9]](O, v2 + 28, G);
                                    G = w[c[3]](G, 8); 
                                end;
                                G = w[c[5]](w[c[4]](O, 192), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 64);
                                w[c[9]](O, 224, G);
                                G = w[c[5]](w[c[4]](O, 196), G);
                                w[c[9]](O, 228, G);
                                G = w[c[5]](w[c[4]](O, 200), G);
                                w[c[9]](O, 232, G);
                                w[c[9]](O, 236, w[c[5]](w[c[4]](O, 204), G));
                            end; 
                        end;
                        local function r84(arg1_23, arg2_23, arg3_23, arg4_23, arg5_23, arg6_23, ...)
                            local c = {
                                c[7],
                                c[11],
                                216,
                                217,
                                c[6],
                                c[15],
                                215,
                                c[8]
                            };
                            v4 = arg6_23;
                            v1 = arg1_23;
                            O = arg3_23;
                            G = arg5_23;
                            E = arg4_23;
                            U = arg2_23;
                            v2 = w[c[1]](w[c[2]](O, E), w[c[2]](v1, 0));
                            v6 = w[c[1]](w[c[2]](O, E + 1), w[c[2]](v1, 1));
                            d = w[c[1]](w[c[2]](O, E + 2), w[c[2]](v1, 2));
                            b = w[c[1]](w[c[2]](O, E + 3), w[c[2]](v1, 3));
                            i = w[c[1]](w[c[2]](O, E + 4), w[c[2]](v1, 4));
                            M = w[c[1]](w[c[2]](O, E + 5), w[c[2]](v1, 5));
                            v7 = w[c[1]](w[c[2]](O, E + 6), w[c[2]](v1, 6));
                            v8 = w[c[1]](w[c[2]](O, E + 7), w[c[2]](v1, 7));
                            e = w[c[1]](w[c[2]](O, E + 8), w[c[2]](v1, 8));
                            l = w[c[1]](w[c[2]](O, E + 9), w[c[2]](v1, 9));
                            F = w[c[1]](w[c[2]](O, E + 10), w[c[2]](v1, 10));
                            u = w[c[1]](w[c[2]](O, E + 11), w[c[2]](v1, 11));
                            m = w[c[1]](w[c[2]](O, E + 12), w[c[2]](v1, 12));
                            H = w[c[1]](w[c[2]](O, E + 13), w[c[2]](v1, 13));
                            n = w[c[1]](w[c[2]](O, E + 14), w[c[2]](v1, 14));
                            X = w[c[1]](w[c[2]](O, E + 15), w[c[2]](v1, 15));
                            p = v2 * 256 + M;
                            L = M * 256 + F;
                            P = F * 256 + X;
                            I = X * 256 + v2;
                            cc = i * 256 + l;
                            sc = l * 256 + n;
                            h = n * 256 + b;
                            Zc = b * 256 + i;
                            Cc = e * 256 + H;
                            gc = H * 256 + d;
                            Sc = d * 256 + v8;
                            Jc = v8 * 256 + e;
                            fc = m * 256 + v6;
                            Qc = v6 * 256 + v7;
                            wc = v7 * 256 + u;
                            ac = u * 256 + m;
                            for Uc = 16, U, 16 do
                                v2 = w[c[1]](w[c[2]](w[c[3]], p), w[c[2]](w[c[4]], P), w[c[2]](v1, Uc));
                                v6 = w[c[1]](w[c[2]](w[c[3]], L), w[c[2]](w[c[4]], I), w[c[2]](v1, Uc + 1));
                                b = w[c[1]](w[c[2]](w[c[3]], I), w[c[2]](w[c[4]], L), w[c[2]](v1, Uc + 3));
                                d = w[c[1]](w[c[2]](w[c[3]], P), w[c[2]](w[c[4]], p), w[c[2]](v1, Uc + 2));
                                i = w[c[1]](w[c[2]](w[c[3]], cc), w[c[2]](w[c[4]], h), w[c[2]](v1, Uc + 4));
                                M = w[c[1]](w[c[2]](w[c[3]], sc), w[c[2]](w[c[4]], Zc), w[c[2]](v1, Uc + 5));
                                v7 = w[c[1]](w[c[2]](w[c[3]], h), w[c[2]](w[c[4]], cc), w[c[2]](v1, Uc + 6));
                                v8 = w[c[1]](w[c[2]](w[c[3]], Zc), w[c[2]](w[c[4]], sc), w[c[2]](v1, Uc + 7));
                                e = w[c[1]](w[c[2]](w[c[3]], Cc), w[c[2]](w[c[4]], Sc), w[c[2]](v1, Uc + 8));
                                l = w[c[1]](w[c[2]](w[c[3]], gc), w[c[2]](w[c[4]], Jc), w[c[2]](v1, Uc + 9));
                                F = w[c[1]](w[c[2]](w[c[3]], Sc), w[c[2]](w[c[4]], Cc), w[c[2]](v1, Uc + 10));
                                u = w[c[1]](w[c[2]](w[c[3]], Jc), w[c[2]](w[c[4]], gc), w[c[2]](v1, Uc + 11));
                                m = w[c[1]](w[c[2]](w[c[3]], fc), w[c[2]](w[c[4]], wc), w[c[2]](v1, Uc + 12));
                                H = w[c[1]](w[c[2]](w[c[3]], Qc), w[c[2]](w[c[4]], ac), w[c[2]](v1, Uc + 13));
                                n = w[c[1]](w[c[2]](w[c[3]], wc), w[c[2]](w[c[4]], fc), w[c[2]](v1, Uc + 14));
                                X = w[c[1]](w[c[2]](w[c[3]], ac), w[c[2]](w[c[4]], Qc), w[c[2]](v1, Uc + 15));
                                P = F * 256 + X;
                                L = M * 256 + F;
                                p = v2 * 256 + M;
                                h = n * 256 + b;
                                Cc = e * 256 + H;
                                cc = i * 256 + l;
                                Sc = d * 256 + v8;
                                Zc = b * 256 + i;
                                gc = H * 256 + d;
                                Jc = v8 * 256 + e;
                                fc = m * 256 + v6;
                                Qc = v6 * 256 + v7;
                                sc = l * 256 + n;
                                wc = v7 * 256 + u;
                                I = X * 256 + v2;
                                ac = u * 256 + m; 
                            end;
                            w[c[5]](G, v4, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], ac), w[c[2]](w[c[4]], Qc), w[c[2]](v1, U + 31)) * 512 + w[c[1]](w[c[2]](w[c[3]], Sc), w[c[2]](w[c[4]], Cc), w[c[2]](v1, U + 26)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], sc), w[c[2]](w[c[4]], Zc), w[c[2]](v1, U + 21)) * 512 + w[c[1]](w[c[2]](w[c[3]], p), w[c[2]](w[c[4]], P), w[c[2]](v1, U + 16)) * 2), w[c[8]](v1, U + 32)));
                            w[c[5]](G, v4 + 4, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], I), w[c[2]](w[c[4]], L), w[c[2]](v1, U + 19)) * 512 + w[c[1]](w[c[2]](w[c[3]], wc), w[c[2]](w[c[4]], fc), w[c[2]](v1, U + 30)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], gc), w[c[2]](w[c[4]], Jc), w[c[2]](v1, U + 25)) * 512 + w[c[1]](w[c[2]](w[c[3]], cc), w[c[2]](w[c[4]], h), w[c[2]](v1, U + 20)) * 2), w[c[8]](v1, U + 36)));
                            w[c[5]](G, v4 + 8, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Zc), w[c[2]](w[c[4]], sc), w[c[2]](v1, U + 23)) * 512 + w[c[1]](w[c[2]](w[c[3]], P), w[c[2]](w[c[4]], p), w[c[2]](v1, U + 18)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Qc), w[c[2]](w[c[4]], ac), w[c[2]](v1, U + 29)) * 512 + w[c[1]](w[c[2]](w[c[3]], Cc), w[c[2]](w[c[4]], Sc), w[c[2]](v1, U + 24)) * 2), w[c[8]](v1, U + 40)));
                            w[c[5]](G, v4 + 12, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Jc), w[c[2]](w[c[4]], gc), w[c[2]](v1, U + 27)) * 512 + w[c[1]](w[c[2]](w[c[3]], h), w[c[2]](w[c[4]], cc), w[c[2]](v1, U + 22)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], L), w[c[2]](w[c[4]], I), w[c[2]](v1, U + 17)) * 512 + w[c[1]](w[c[2]](w[c[3]], fc), w[c[2]](w[c[4]], wc), w[c[2]](v1, U + 28)) * 2), w[c[8]](v1, U + 44)));
                            return; 
                        end;
                        local function r85(arg1_24, arg2_24, arg3_24, arg4_24, arg5_24, arg6_24, ...)
                            local c = {
                                c[7],
                                c[11],
                                218,
                                219,
                                220,
                                c[6]
                            };
                            U = arg2_24;
                            O = arg3_24;
                            v1 = arg1_24;
                            E = arg4_24;
                            G = arg5_24;
                            v4 = arg6_24;
                            v2 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E) * 256 + w[c[2]](v1, U + 32)), w[c[2]](v1, U + 16));
                            v6 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 13) * 256 + w[c[2]](v1, U + 45)), w[c[2]](v1, U + 17));
                            d = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 10) * 256 + w[c[2]](v1, U + 42)), w[c[2]](v1, U + 18));
                            b = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 7) * 256 + w[c[2]](v1, U + 39)), w[c[2]](v1, U + 19));
                            i = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 4) * 256 + w[c[2]](v1, U + 36)), w[c[2]](v1, U + 20));
                            M = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 1) * 256 + w[c[2]](v1, U + 33)), w[c[2]](v1, U + 21));
                            v7 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 14) * 256 + w[c[2]](v1, U + 46)), w[c[2]](v1, U + 22));
                            v8 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 11) * 256 + w[c[2]](v1, U + 43)), w[c[2]](v1, U + 23));
                            e = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 8) * 256 + w[c[2]](v1, U + 40)), w[c[2]](v1, U + 24));
                            l = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 5) * 256 + w[c[2]](v1, U + 37)), w[c[2]](v1, U + 25));
                            F = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 2) * 256 + w[c[2]](v1, U + 34)), w[c[2]](v1, U + 26));
                            u = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 15) * 256 + w[c[2]](v1, U + 47)), w[c[2]](v1, U + 27));
                            m = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 12) * 256 + w[c[2]](v1, U + 44)), w[c[2]](v1, U + 28));
                            H = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 9) * 256 + w[c[2]](v1, U + 41)), w[c[2]](v1, U + 29));
                            n = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 6) * 256 + w[c[2]](v1, U + 38)), w[c[2]](v1, U + 30));
                            X = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 3) * 256 + w[c[2]](v1, U + 35)), w[c[2]](v1, U + 31));
                            p = v2 * 256 + v6;
                            L = v6 * 256 + d;
                            P = d * 256 + b;
                            I = b * 256 + v2;
                            cc = i * 256 + M;
                            sc = M * 256 + v7;
                            h = v7 * 256 + v8;
                            Zc = v8 * 256 + i;
                            Cc = e * 256 + l;
                            gc = l * 256 + F;
                            Sc = F * 256 + u;
                            Jc = u * 256 + e;
                            fc = m * 256 + H;
                            Qc = H * 256 + n;
                            wc = n * 256 + X;
                            ac = X * 256 + m;
                            v3 = 0;
                            for Ec = U, 16, -16 do
                                v2 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], p) * 256 + w[c[2]](w[c[5]], P)), w[c[2]](v1, Ec));
                                v6 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Qc) * 256 + w[c[2]](w[c[5]], ac)), w[c[2]](v1, Ec + 1));
                                d = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Sc) * 256 + w[c[2]](w[c[5]], Cc)), w[c[2]](v1, Ec + 2));
                                b = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Zc) * 256 + w[c[2]](w[c[5]], sc)), w[c[2]](v1, Ec + 3));
                                i = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], cc) * 256 + w[c[2]](w[c[5]], h)), w[c[2]](v1, Ec + 4));
                                M = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], L) * 256 + w[c[2]](w[c[5]], I)), w[c[2]](v1, Ec + 5));
                                v7 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], wc) * 256 + w[c[2]](w[c[5]], fc)), w[c[2]](v1, Ec + 6));
                                v8 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Jc) * 256 + w[c[2]](w[c[5]], gc)), w[c[2]](v1, Ec + 7));
                                e = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Cc) * 256 + w[c[2]](w[c[5]], Sc)), w[c[2]](v1, Ec + 8));
                                l = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], sc) * 256 + w[c[2]](w[c[5]], Zc)), w[c[2]](v1, Ec + 9));
                                F = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], P) * 256 + w[c[2]](w[c[5]], p)), w[c[2]](v1, Ec + 10));
                                u = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], ac) * 256 + w[c[2]](w[c[5]], Qc)), w[c[2]](v1, Ec + 11));
                                m = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], fc) * 256 + w[c[2]](w[c[5]], wc)), w[c[2]](v1, Ec + 12));
                                H = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], gc) * 256 + w[c[2]](w[c[5]], Jc)), w[c[2]](v1, Ec + 13));
                                n = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], h) * 256 + w[c[2]](w[c[5]], cc)), w[c[2]](v1, Ec + 14));
                                X = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], I) * 256 + w[c[2]](w[c[5]], L)), w[c[2]](v1, Ec + 15));
                                p = v2 * 256 + v6;
                                I = b * 256 + v2;
                                sc = M * 256 + v7;
                                L = v6 * 256 + d;
                                P = d * 256 + b;
                                Sc = F * 256 + u;
                                gc = l * 256 + F;
                                Cc = e * 256 + l;
                                cc = i * 256 + M;
                                Zc = v8 * 256 + i;
                                Jc = u * 256 + e;
                                wc = n * 256 + X;
                                h = v7 * 256 + v8;
                                fc = m * 256 + H;
                                Qc = H * 256 + n;
                                ac = X * 256 + m; 
                            end;
                            w[c[6]](G, v4, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Zc) * 256 + w[c[2]](w[c[5]], sc)), w[c[2]](v1, 3)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Sc) * 256 + w[c[2]](w[c[5]], Cc)), w[c[2]](v1, 2)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Qc) * 256 + w[c[2]](w[c[5]], ac)), w[c[2]](v1, 1)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], p) * 256 + w[c[2]](w[c[5]], P)), w[c[2]](v1, 0)));
                            w[c[6]](G, v4 + 4, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Jc) * 256 + w[c[2]](w[c[5]], gc)), w[c[2]](v1, 7)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], wc) * 256 + w[c[2]](w[c[5]], fc)), w[c[2]](v1, 6)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], L) * 256 + w[c[2]](w[c[5]], I)), w[c[2]](v1, 5)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], cc) * 256 + w[c[2]](w[c[5]], h)), w[c[2]](v1, 4)));
                            w[c[6]](G, v4 + 8, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], ac) * 256 + w[c[2]](w[c[5]], Qc)), w[c[2]](v1, 11)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], P) * 256 + w[c[2]](w[c[5]], p)), w[c[2]](v1, 10)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], sc) * 256 + w[c[2]](w[c[5]], Zc)), w[c[2]](v1, 9)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Cc) * 256 + w[c[2]](w[c[5]], Sc)), w[c[2]](v1, 8)));
                            w[c[6]](G, v4 + 12, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], I) * 256 + w[c[2]](w[c[5]], L)), w[c[2]](v1, 15)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], h) * 256 + w[c[2]](w[c[5]], cc)), w[c[2]](v1, 14)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], gc) * 256 + w[c[2]](w[c[5]], Jc)), w[c[2]](v1, 13)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], fc) * 256 + w[c[2]](w[c[5]], wc)), w[c[2]](v1, 12)));
                            return; 
                        end;
                        v7 = w[c[1]](256);
                        u = 1;
                        m = 1;
                        local function n(arg1_25, arg2_25, ...)
                            U = arg2_25;
                            O = 0;
                            for E = 0, 7 do
                                if U % 2 == 1 then
                                    O = w[c[7]](O, arg1_25);
                                end;
                                if arg1_25 >= 128 then
                                    w[c[7]](arg1_25 * 2 % 256, 27);
                                else
                                    v1 = arg1_25 * 2 % 256;
                                end;
                                U = w[c[16]](U / 2); 
                            end;
                            return O; 
                        end;
                        w[c[17]](v7, 0, 99);
                        for X = 1, 255 do
                            gc = v5;
                            u = w[c[7]](1, 1 * 2, 1 < 128 and 0 or 27) % 256;
                            m = w[c[7]](1, 1 * 2);
                            m = w[c[7]](m, m * 4);
                            m = w[c[7]](m, m * 16) % 256;
                            if m >= 128 then
                                w[c[7]](cc, 9);
                            end;
                            H = w[c[7]](m, m % 128 * 2 + m / 128, m % 64 * 4 + m / 64, m % 32 * 8 + m / 32, m % 16 * 16 + m / 16, 99);
                            w[c[17]](v7, u, H);
                            w[c[17]](w[c[1]](256), H, u);
                            w[c[17]](w[c[1]](256), u, n(3, u));
                            w[c[17]](w[c[1]](256), u, n(9, u));
                            w[c[17]](w[c[1]](256), u, n(11, u)); 
                        end;
                        H = 0;
                        for Zc = 0, 255 do
                            u = w[c[11]](v7, Zc);
                            P = u * 256;
                            L = n(13, Zc);
                            X = n(2, u);
                            p = n(14, Zc);
                            for Ec = 0, 255 do
                                m = w[c[11]](w[c[1]](256), Ec);
                                w[c[18]](r75, v5 * 2, P + m);
                                w[c[17]](r78, v5, w[c[11]](w[c[1]](256), w[c[7]](Zc, Ec)));
                                w[c[17]](r76, v5, w[c[7]](X, w[c[11]](w[c[1]](256), m)));
                                w[c[17]](r77, v5, w[c[7]](u, m));
                                w[c[17]](r79, v5, w[c[7]](p, w[c[11]](w[c[1]](256), Ec)));
                                w[c[17]](r80, v5, w[c[7]](L, w[c[11]](w[c[1]](256), Ec)));
                                H = v5 + 1; 
                            end; 
                        end;
                        local function r86(arg1_26, arg2_26, ...)
                            local c = {
                                c[12],
                                c[2],
                                c[3]
                            };
                            v1 = arg1_26;
                            return w[c[1]](string.format("%s cannot be assigned to", tostring(arg2_26))); 
                        end;
                        local function r87(...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            return "AesCipher"; 
                        end;
                        return (function(arg1_28, arg2_28, arg3_28, ...)
                            local c = {
                                c[4],
                                c[20],
                                c[21],
                                c[12],
                                c[2],
                                c[3],
                                221,
                                222,
                                c[22],
                                c[23],
                                224,
                                225,
                                c[19],
                                c[24],
                                c[1],
                                17,
                                18
                            };
                            O = arg3_28;
                            U = arg2_28;
                            v1 = arg1_28;
                            r88 = w[c[1]](v1);
                            r91 = w[c[2]](v1);
                            if r88 == 240 then
                                r89 = 192;
                                r90 = w[c[3]](r91, 1, 32);
                            else
                                if r88 == 208 then
                                    r89 = 160;
                                    r90 = w[c[21]](r91, 1, 24);
                                else
                                    if r88 == 176 then
                                        r89 = 128;
                                        r90 = w[c[21]](r91, 1, 16);
                                    else
                                        w[c[4]]("Round keys must be either 240, 208 or 128 bytes long");
                                    end;
                                    v8 = v3 == v6;
                                    r92 = arg1_28;
                                    v7 = U;
                                    if U then
                                        r93 = U;
                                        r94 = r93.FwdMode;
                                        F = v5;
                                        r95 = r93.InvMode;
                                        X = w[c[6]];
                                        u = v5;
                                        r96 = r93.SegmentSize or 16;
                                        v7 = O;
                                        if O then
                                            v5 = v5;
                                            r97 = O;
                                            r98 = r97.Pad;
                                            r99 = r97.Unpad;
                                            r100 = w[c[9]](true);
                                            X = w[c[10]](r100);
                                            local function r101(arg1_29, arg2_29, arg3_29, arg4_29, ...)
                                                local c = {
                                                    i,
                                                    59,
                                                    15
                                                };
                                                w[c[1]](w[c[2]], w[c[3]], arg1_29, arg2_29, arg3_29, arg4_29);
                                                return; 
                                            end;
                                            local function r102(arg1_30, arg2_30, arg3_30, arg4_30, ...)
                                                local c = {
                                                    M,
                                                    59,
                                                    15
                                                };
                                                w[c[1]](w[c[2]], w[c[3]], arg1_30, arg2_30, arg3_30, arg4_30);
                                                return; 
                                            end;
                                            r103 = {
                                                ["Encrypt"] = function(arg1_31, arg2_31, arg3_31, ...)
                                                    local c = {
                                                        c[13],
                                                        c[5],
                                                        c[6],
                                                        c[14],
                                                        c[4],
                                                        84,
                                                        15,
                                                        82,
                                                        174,
                                                        172,
                                                        86,
                                                        85,
                                                        81,
                                                        171,
                                                        c[15]
                                                    };
                                                    U = arg2_31;
                                                    O = arg3_31;
                                                    v1 = arg1_31;
                                                    v5 = w[c[1]];
                                                    v4 = v5;
                                                    E = {
                                                        f(4, S(C))
                                                    };
                                                    G = v5(U);
                                                    M = w[c[3]];
                                                    v2 = G == "buffer";
                                                    v3 = v2 and ;
                                                    v5 = v5;
                                                    if v2 then
                                                        v8 = 7141567417597;
                                                        v5 = v5;
                                                        v4 = (v2 and )[1];
                                                        O = w[c[1]](O) == w[c[2]][w[c[3]]("E-\xf0\x03t\x8c", v8)] and O;
                                                        v2 = w[c[6]];
                                                        if v1 ~= v2 then
                                                            return v1.Encrypt(v1, v4, O, ...);
                                                        end;
                                                        if w[c[7]] then
                                                            v2 = w[c[8]](v4, O, w[c[9]]);
                                                            v5 = w[c[10]];
                                                            v7 = v5;
                                                            v8 = w[c[13]].Overwrite == false;
                                                            M = v8 and ;
                                                            v5 = v5;
                                                            if v8 then
                                                                v5 = v5;
                                                                v5(w[c[11]], w[c[12]], (v8 and )[1], v2, r93, ...);
                                                                return v2;
                                                            else
                                                                
                                                            end;
                                                        end;
                                                        w[c[5]]("AesCipher object's already destroyed");
                                                        return w[c[15]](0);
                                                    else
                                                        M = (G == "string" and {
                                                            w[c[4]](U)
                                                        } or {
                                                            w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                        })[1];
                                                        v5 = v6;
                                                        v5 = v6;
                                                        v3 = {
                                                            (G == "string" and {
                                                                w[c[4]](U)
                                                            } or {
                                                                w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                            })[1]
                                                        };
                                                    end; 
                                                end,
                                                ["Decrypt"] = function(arg1_32, arg2_32, arg3_32, ...)
                                                    local c = {
                                                        c[13],
                                                        c[5],
                                                        c[6],
                                                        c[14],
                                                        c[4],
                                                        84,
                                                        15,
                                                        81,
                                                        c[15],
                                                        c[1],
                                                        173,
                                                        86,
                                                        85,
                                                        171,
                                                        83,
                                                        174
                                                    };
                                                    v1 = arg1_32;
                                                    O = arg3_32;
                                                    v5 = w[c[1]];
                                                    E = {
                                                        f(4, S(C))
                                                    };
                                                    U = arg2_32;
                                                    v4 = v5;
                                                    M = w[c[3]];
                                                    G = v5(U);
                                                    v2 = G == "buffer";
                                                    v3 = v2 and ;
                                                    v5 = v5;
                                                    if v2 then
                                                        v5 = v5;
                                                        v4 = (v2 and )[1];
                                                        b = w[c[2]];
                                                        if v1 ~= w[c[6]] then
                                                            return v1.Decrypt(v1, v4, w[c[1]](O) == "buffer" and O, ...);
                                                        end;
                                                        if w[c[7]] then
                                                            v5 = w[c[8]].Overwrite;
                                                            d = v5;
                                                            b = v5 == nil and {
                                                                w[c[9]](w[c[10]](v4))
                                                            };
                                                            v6 = b;
                                                            v5 = v5;
                                                            if b then
                                                            end;
                                                        end;
                                                        w[c[5]]("AesCipher object's already destroyed");
                                                        return w[c[9]](0);
                                                    else
                                                        M = (G == "string" and {
                                                            w[c[4]](U)
                                                        } or {
                                                            w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                        })[1];
                                                        v5 = v6;
                                                        v5 = v6;
                                                        v3 = {
                                                            (G == "string" and {
                                                                w[c[4]](U)
                                                            } or {
                                                                w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                            })[1]
                                                        };
                                                    end; 
                                                end,
                                                ["EncryptBlock"] = function(arg1_33, arg2_33, arg3_33, arg4_33, arg5_33, ...)
                                                    local c = {
                                                        84,
                                                        15,
                                                        c[11],
                                                        59,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    G = arg5_33;
                                                    v1 = arg1_33;
                                                    E = arg4_33;
                                                    if v1 ~= w[c[1]] then
                                                        v1.EncryptBlock(v1, arg2_33, arg3_33, E, G);
                                                    else
                                                        if w[c[2]] then
                                                            v4 = w[c[4]];
                                                            v6 = E;
                                                            v2 = w[c[2]];
                                                            d = w[c[3]];
                                                            if E then
                                                                v5 = v5;
                                                                if G then
                                                                    v5 = v5;
                                                                    v5(w[c[4]], w[c[2]], arg2_33, arg3_33, E, G);
                                                                    return;
                                                                else
                                                                    d = arg3_33;
                                                                end;
                                                            else
                                                                v6 = arg2_33;
                                                            end;
                                                        else
                                                            w[c[5]]("AesCipher object's already destroyed");
                                                        end;
                                                    end; 
                                                end,
                                                ["DecryptBlock"] = function(arg1_34, arg2_34, arg3_34, arg4_34, arg5_34, ...)
                                                    local c = {
                                                        84,
                                                        15,
                                                        c[12],
                                                        59,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    v1 = arg1_34;
                                                    E = arg4_34;
                                                    G = arg5_34;
                                                    if v1 ~= w[c[1]] then
                                                        v1.DecryptBlock(v1, arg2_34, arg3_34, E, G);
                                                    else
                                                        if w[c[2]] then
                                                            d = w[c[3]];
                                                            v6 = E;
                                                            v4 = w[c[4]];
                                                            v2 = w[c[2]];
                                                            if E then
                                                                v5 = d;
                                                                if G then
                                                                    v5 = v5;
                                                                    v5(w[c[4]], w[c[2]], arg2_34, arg3_34, E, G);
                                                                    return;
                                                                else
                                                                    d = arg3_34;
                                                                end;
                                                            else
                                                                v6 = arg2_34;
                                                            end;
                                                        else
                                                            w[c[5]]("AesCipher object's already destroyed");
                                                        end;
                                                    end; 
                                                end,
                                                ["Destroy"] = function(arg1_35, ...)
                                                    local c = {
                                                        84,
                                                        15,
                                                        12,
                                                        59,
                                                        172,
                                                        173,
                                                        171,
                                                        81,
                                                        13,
                                                        14,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    v1 = arg1_35;
                                                    if v1 ~= w[c[1]] then
                                                        v1.Destroy(v1);
                                                    else
                                                        if w[c[2]] then
                                                            w[c[3]] = nil;
                                                            w[c[4]] = nil;
                                                            w[c[2]] = nil;
                                                            w[c[5]] = nil;
                                                            w[c[6]] = nil;
                                                            w[c[7]] = nil;
                                                            w[c[8]] = nil;
                                                            w[c[9]] = nil;
                                                            w[c[10]] = nil;
                                                        else
                                                            w[c[11]]("AesCipher object's already destroyed");
                                                        end;
                                                        return;
                                                    end; 
                                                end
                                            };
                                            r104 = {
                                                ["Key"] = r90,
                                                ["RoundKeys"] = r91,
                                                ["Mode"] = r93,
                                                ["Padding"] = r97,
                                                ["Length"] = r88
                                            };
                                            X.__index = function(arg1_36, arg2_36, ...)
                                                local c = {
                                                    87,
                                                    15,
                                                    88,
                                                    c[4],
                                                    c[5],
                                                    c[6]
                                                };
                                                v1 = arg1_36;
                                                U = arg2_36;
                                                if w[c[1]][U] then
                                                    return w[c[1]][U];
                                                end;
                                                O = w[c[2]];
                                                if O and w[c[3]][U] then
                                                    return w[c[3]][U];
                                                end;
                                                if w[c[2]] then
                                                    O = "%s is not a valid member of AesCipher";
                                                    w[c[4]](O.format(O, U));
                                                else
                                                    w[c[4]]("AesCipher object's already destroyed");
                                                end;
                                                return; 
                                            end;
                                            X.__newindex = w[c[16]];
                                            X.__tostring = w[c[17]];
                                            X.__len = function(...)
                                                local c = {
                                                    14,
                                                    c[4],
                                                    c[5],
                                                    c[6]
                                                };
                                                v1 = w[c[1]];
                                                if v1 then
                                                    return v1;
                                                else
                                                    w[c[2]]("AesCipher object's destroyed");
                                                end; 
                                            end;
                                            X.__metatable = "AesCipher object: Metatable's locked";
                                            return r100;
                                        else
                                            v7 = w[d];
                                        end;
                                    else
                                        v7 = r81;
                                    end;
                                end;
                            end; 
                        end)((function(arg1_27, arg2_27, ...)
                            local c = {
                                c[19],
                                c[2],
                                c[3],
                                c[4],
                                c[12],
                                223,
                                c[1]
                            };
                            U = arg2_27;
                            v1 = arg1_27;
                            v5 = w[c[1]](v1) == "buffer";
                            E = v5;
                            v3 = v5 and {
                                w[c[4]](v1)
                            };
                            v5 = v5;
                            if v5 then
                                v5 = v5;
                                v5 = (G and {
                                    w[c[4]](v1)
                                })[1];
                                v4 = w[c[6]];
                                v5 = w[c[6]];
                                if U then
                                    v5 = v5;
                                    return v5(arg1_27, v5, U, v5);
                                else
                                    w[c[1]](v5 == 32 and 240 or (v5 == 16 and 176 or v5 == 24 and 208));
                                end;
                            else
                                v3 = {
                                    #v1
                                };
                            end; 
                        end)(arg1_17), r81, r82); 
                    end,
                    ["\x00ECC"] = function(arg1_37, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_37;
                        local function r105(arg1_38, ...)
                            v1 = arg1_38;
                            for U = 0, 15 do
                                v1[U] = v1[U] + 65536;
                                v2 = v1[U] / 65536 - v1[U] / 65536 % 1;
                                if U < 15 then
                                    v1[U + 1] = v1[U + 1] + v2 - 1;
                                else
                                    v1[0] = v1[0] + 38 * (v2 - 1);
                                end;
                                v1[U] = v1[U] - v2 * 65536; 
                            end;
                            return; 
                        end;
                        local function r106(arg1_39, arg2_39, arg3_39, ...)
                            U = arg2_39;
                            O = arg3_39;
                            v1 = arg1_39;
                            for E = 0, 15 do
                                v1[E] = v1[E] * ((O - 1) % 2) + U[E] * O;
                                U[E] = U[E] * ((O - 1) % 2) + v1[E] * O; 
                            end;
                            return; 
                        end;
                        local function r107(arg1_40, arg2_40, ...)
                            v1 = arg1_40;
                            U = arg2_40;
                            for O = 0, 15 do
                                v1[32] = 31[2 * 32] + 31[2 * 32 + 1] * 256; 
                            end;
                            v1[15] = v1[15] % 32768;
                            return; 
                        end;
                        local function r108(arg1_41, arg2_41, ...)
                            local c = {
                                154,
                                152
                            };
                            v1 = arg1_41;
                            O = {};
                            E = {};
                            for G = 0, 15 do
                                O[G] = arg2_41[G]; 
                            end;
                            w[c[1]](O);
                            w[c[1]](O);
                            w[c[1]](O);
                            G = {
                                [0] = 65517,
                                [15] = 32767
                            };
                            for r = 1, 14 do
                                G[v4] = 65535; 
                            end;
                            for r = 0, 1 do
                                i = O[0];
                                M = G[0];
                                E[0] = 0;
                                for Q = 0, 15, 15 do
                                    e = 0;
                                    v3 = ({})[e] - G[e];
                                    E[e] = v3 - (E[e - 1] / 65536 - E[e - 1] / 65536 % 1) % 2;
                                    E[e - 1] = (E[e - 1] + 65536) % 65536; 
                                end;
                                w[c[2]](O, E, 1 - (E[15] / 65536 - E[15] / 65536 % 1) % 2); 
                            end;
                            for r = 0, 15 do
                                v1[2 * v4] = O[v4] % 256;
                                v1[2 * v4 + 1] = O[v4] / 256 - O[v4] / 256 % 1; 
                            end;
                            return; 
                        end;
                        local function r109(arg1_42, arg2_42, arg3_42, ...)
                            for E = 0, 15 do
                                arg1_42[E] = arg2_42[E] + arg3_42[E]; 
                            end;
                            return; 
                        end;
                        local function r110(arg1_43, arg2_43, arg3_43, ...)
                            for E = 0, 15 do
                                arg1_43[E] = arg2_43[E] - arg3_43[E]; 
                            end;
                            return; 
                        end;
                        local function r111(arg1_44, arg2_44, arg3_44, ...)
                            local c = {
                                154
                            };
                            v1 = arg1_44;
                            O = arg3_44;
                            U = arg2_44;
                            E = {};
                            for G = 0, 31 do
                                E[G] = 0; 
                            end;
                            for G = 0, 15 do
                                for b = 0, 15 do
                                    E[G + b] = E[G + b] + arg2_44[G] * arg3_44[b]; 
                                end; 
                            end;
                            for G = 0, 14 do
                                E[G] = E[G] + 38 * E[G + 16]; 
                            end;
                            for G = 0, 15 do
                                v1[G] = E[G]; 
                            end;
                            w[c[1]](v1);
                            w[c[1]](v1);
                            return; 
                        end;
                        local function r112(arg1_45, arg2_45, ...)
                            O = {};
                            for E = 0, 15 do
                                O[E] = arg2_45[E]; 
                            end;
                            for E = 253, 0, -1 do
                                r111(O, O, O);
                                if E ~= 2 and E ~= 4 then
                                    w[v6](O, O, arg2_45);
                                end; 
                            end;
                            for E = 0, 15 do
                                arg1_45[E] = O[E]; 
                            end;
                            return; 
                        end;
                        local function r113(arg1_46, arg2_46, arg3_46, ...)
                            local c = {
                                155,
                                152,
                                153,
                                156,
                                158,
                                160,
                                157
                            };
                            v2 = {};
                            G = {};
                            U = arg2_46;
                            v6 = {};
                            b = {};
                            d = {};
                            v4 = {};
                            i = {};
                            E = {};
                            w[c[1]](v6, arg3_46);
                            for M = 0, 15 do
                                b[M] = 0;
                                i[M] = v6[M];
                                E[M] = 0;
                                G[M] = 0; 
                            end;
                            b[0] = 1;
                            G[0] = 1;
                            for M = 0, 30 do
                                d[M] = U[M]; 
                            end;
                            M = d[0];
                            v7 = d[0] % 8;
                            d[0] = 0;
                            d[31] = U[31] % 64 + 64;
                            v8 = -1;
                            for Q = 0, 0, 0 do
                                l = 0;
                                v3 = d[l / 8 - l / 8 % 1] / 2 ^ (l % 8) - d[l / 8 - l / 8 % 1] / 2 ^ (l % 8) % 1;
                                F = v3 % 2;
                                w[c[2]](b, i, F);
                                w[c[2]](E, G, F);
                                w[c[3]](v4, b, E);
                                w[c[4]](b, b, E);
                                w[c[3]](E, i, G);
                                w[c[4]](i, i, G);
                                w[c[5]](G, v4, v4);
                                w[c[5]](v2, b, b);
                                w[c[5]](b, E, b);
                                w[c[5]](E, i, v4);
                                w[c[3]](v4, b, E);
                                w[c[4]](b, b, E);
                                w[c[5]](i, b, b);
                                w[c[4]](E, G, v2);
                                w[c[5]](b, E, {
                                    [0] = 56129,
                                    1,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0
                                });
                                w[c[3]](b, b, G);
                                w[c[5]](E, E, b);
                                w[c[5]](b, G, v2);
                                w[c[5]](G, i, v6);
                                w[c[5]](i, v4, v4);
                                w[c[2]](b, i, F);
                                w[c[2]](E, G, F); 
                            end;
                            w[c[6]](E, E);
                            w[c[5]](b, b, E);
                            w[c[7]](arg1_46, b);
                            return; 
                        end;
                        return {
                            ["generate_keypair"] = function(arg1_47, ...)
                                v1 = arg1_47;
                                if v1 then
                                    U = {};
                                    v1 = v1;
                                    O = {};
                                    for G = 0, 31 do
                                        O[G] = v1(); 
                                    end;
                                    E = {
                                        [0] = 9
                                    };
                                    for r = 1, 31 do
                                        E[v4] = 0; 
                                    end;
                                    r113(U, O, E);
                                    return O, U;
                                else
                                    local function v3(...)
                                        local c = {
                                            c[1],
                                            c[2]
                                        };
                                        return math.random(0, 255); 
                                    end;
                                end; 
                            end,
                            ["get_shared_key"] = function(arg1_48, arg2_48, ...)
                                O = {};
                                r113(O, arg1_48, arg2_48);
                                return O; 
                            end
                        }; 
                    end,
                    ["\x00HASH"] = function(arg1_49, ...)
                        local c = {
                            c[25],
                            c[1],
                            c[2],
                            c[5]
                        };
                        r114 = 4294967296;
                        r115 = r114 - 1;
                        local function r116(arg1_50, ...)
                            r117 = arg1_50;
                            U = {};
                            r118 = w[c[25]]({}, U);
                            U.__index = function(arg1_51, arg2_51, ...)
                                local c = {
                                    55,
                                    56
                                };
                                U = arg2_51;
                                v1 = arg1_51;
                                O = w[c[1]](U);
                                w[c[2]][U] = O;
                                return O; 
                            end;
                            return r118; 
                        end;
                        local function r119(arg1_52, arg2_52, ...)
                            r120 = arg1_52;
                            r121 = arg2_52;
                            local function O(arg1_53, arg2_53, ...)
                                local c = {
                                    54,
                                    53
                                };
                                v1 = arg1_53;
                                U = arg2_53;
                                O = 0;
                                G = v1 ~= 0;
                                v3 = G;
                                while not G do
                                    if v3 then
                                        v4 = U % w[c[1]];
                                        G = v1 % w[c[1]];
                                        O = O + w[c[2]][G][v4] * 1;
                                        v1 = (v1 - G) / w[c[1]];
                                        U = (U - v4) / w[c[1]];
                                        E = 1 * w[c[1]];
                                    end;
                                    return v5 + (v1 + U) * 1; 
                                end;
                                v3 = U ~= 0; 
                            end;
                            return O; 
                        end;
                        r122 = (function(arg1_54, ...)
                            local c = {
                                62,
                                61,
                                c[2],
                                c[3]
                            };
                            v1 = arg1_54;
                            r123 = w[c[1]](v1, 2);
                            v5 = w[c[1]];
                            v2 = v5;
                            return v5(w[c[2]](function(arg1_55, ...)
                                r124 = arg1_55;
                                return w[E](function(arg1_56, ...)
                                    local c = {
                                        U,
                                        105
                                    };
                                    return w[c[1]](w[c[2]], arg1_56); 
                                end); 
                            end), 2 ^ (v1.n or 1)); 
                        end)({
                            [0] = {
                                [0] = 0,
                                [1] = 1
                            },
                            [1] = {
                                [0] = 1,
                                [1] = 0
                            },
                            ["n"] = 4
                        });
                        local function r125(arg1_57, arg2_57, arg3_57, ...)
                            local c = {
                                60,
                                66,
                                67
                            };
                            E = {
                                f(4, S(C))
                            };
                            v1 = arg1_57;
                            if arg2_57 then
                                G = w[c[2]](arg1_57 % w[c[1]], arg2_57 % w[c[1]]);
                                if arg3_57 then
                                    w[v6](v2, arg3_57, ...);
                                end;
                                return G;
                            end;
                            if v1 then
                                return v1 % w[c[1]];
                            end;
                            return 0; 
                        end;
                        local function r126(arg1_58, arg2_58, arg3_58, ...)
                            local c = {
                                60,
                                66,
                                63
                            };
                            U = arg2_58;
                            E = {
                                f(4, S(C))
                            };
                            v1 = arg1_58;
                            if U then
                                v1 = arg1_58 % w[c[1]];
                                U = arg2_58 % w[c[1]];
                                G = (v1 + U - w[c[2]](v1, U)) / 2;
                                if arg3_58 then
                                    bit32_band(v4, arg3_58, ...);
                                end;
                                return G;
                            end;
                            if v1 then
                                return v1 % w[c[1]];
                            end;
                            return w[c[3]]; 
                        end;
                        local function r127(arg1_59, ...)
                            return (-1 - arg1_59) % r114; 
                        end;
                        local function r128(arg1_60, arg2_60, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            U = arg2_60;
                            v1 = arg1_60;
                            if U < 0 then
                                return lshift(v1, -U);
                            end;
                            return math.floor(v1 % 4294967296 / 2 ^ U); 
                        end;
                        local function r129(arg1_61, arg2_61, ...)
                            local c = {
                                68,
                                60
                            };
                            U = arg2_61;
                            if U > 31 or U < -31 then
                                return 0;
                            end;
                            return w[c[1]](arg1_61 % w[c[2]], U); 
                        end;
                        local function r130(arg1_62, arg2_62, ...)
                            v1 = arg1_62;
                            U = arg2_62;
                            if U < 0 then
                                return r129(v1, -U);
                            end;
                            return v1 * 2 ^ U % 4294967296; 
                        end;
                        local function r131(arg1_63, arg2_63, ...)
                            local c = {
                                60,
                                65,
                                70,
                                71
                            };
                            v1 = arg1_63 % w[c[1]];
                            U = arg2_63 % 32;
                            return w[c[3]](v1, U) + w[c[4]](w[c[2]](v1, 2 ^ U - 1), 32 - U); 
                        end;
                        r132 = {
                            1116352408,
                            1899447441,
                            3049323471,
                            3921009573,
                            961987163,
                            1508970993,
                            2453635748,
                            2870763221,
                            3624381080,
                            310598401,
                            607225278,
                            1426881987,
                            1925078388,
                            2162078206,
                            2614888103,
                            3248222580,
                            3835390401,
                            4022224774,
                            264347078,
                            604807628,
                            770255983,
                            1249150122,
                            1555081692,
                            1996064986,
                            2554220882,
                            2821834349,
                            2952996808,
                            3210313671,
                            3336571891,
                            3584528711,
                            113926993,
                            338241895,
                            666307205,
                            773529912,
                            1294757372,
                            1396182291,
                            1695183700,
                            1986661051,
                            2177026350,
                            2456956037,
                            2730485921,
                            2820302411,
                            3259730800,
                            3345764771,
                            3516065817,
                            3600352804,
                            4094571909,
                            275423344,
                            430227734,
                            506948616,
                            659060556,
                            883997877,
                            958139571,
                            1322822218,
                            1537002063,
                            1747873779,
                            1955562222,
                            2024104815,
                            2227730452,
                            2361852424,
                            2428436474,
                            2756734187,
                            3204031479,
                            3329325298
                        };
                        local function r133(arg1_64, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            return string.gsub(arg1_64, ".", function(arg1_65, ...)
                                local c = {
                                    c[1],
                                    c[2]
                                };
                                return string.format("%02x", string.byte(arg1_65)); 
                            end); 
                        end;
                        local function r134(arg1_66, arg2_66, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            v1 = arg1_66;
                            for G = 1, arg2_66 do
                                d = v1 % 256;
                                O = string.char(d) .. O;
                                v1 = (v1 - d) / 256; 
                            end;
                            return ""; 
                        end;
                        local function r135(arg1_67, arg2_67, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            O = 0;
                            U = arg2_67;
                            v3 = 0;
                            for o = U, U + 3 do
                                O = O * 256 + string.byte(arg1_67, v2); 
                            end;
                            return O; 
                        end;
                        local function r136(arg1_68, arg2_68, ...)
                            local c = {
                                75,
                                c[2],
                                c[3],
                                c[4]
                            };
                            U = arg2_68;
                            U = w[c[1]](8 * U, 8);
                            v1 = arg1_68 .. "\x80" .. string.rep("\x00", 64 - (U + 9) % 64) .. U;
                            w[c[4]](#v1 % 64 == 0);
                            return v1; 
                        end;
                        local function r137(arg1_69, ...)
                            v1 = arg1_69;
                            v1[1] = 1779033703;
                            v1[2] = 3144134277;
                            v1[3] = 1013904242;
                            v1[4] = 2773480762;
                            v1[5] = 1359893119;
                            v1[6] = 2600822924;
                            v1[7] = 528734635;
                            v1[8] = 1541459225;
                            return v1; 
                        end;
                        local function r138(arg1_70, arg2_70, arg3_70, ...)
                            local c = {
                                73,
                                67,
                                64,
                                70,
                                65,
                                69,
                                72
                            };
                            O = arg3_70;
                            E = {};
                            for G = 1, 16 do
                                E[G] = w[c[1]](arg1_70, arg2_70 + (G - 1) * 4); 
                            end;
                            for G = 17, 64 do
                                b = E[G - 15];
                                b = E[G - 2];
                                E[G] = E[G - 16] + w[c[2]](w[c[3]](b, 7), w[c[3]](b, 18), w[c[4]](b, 3)) + E[G - 7] + w[c[2]](w[c[3]](b, 17), w[c[3]](b, 19), w[c[4]](b, 10)); 
                            end;
                            for N = 1, 64 do
                                p = O[8] + w[c[2]](w[c[3]](v2, 6), w[c[3]](v2, 11), w[c[3]](v2, 25)) + w[c[2]](w[c[5]](v2, v6), w[c[5]](w[c[6]](v2), d)) + w[c[7]][v7] + E[v7];
                                M = i;
                                G = M;
                                b = d;
                                v2 = O[4] + p;
                                i = p + w[c[2]](w[c[3]](i, 2), w[c[3]](i, 13), w[c[3]](i, 22)) + w[c[2]](w[c[5]](i, M), w[c[5]](i, G), w[c[5]](M, G));
                                v4 = G;
                                d = v6;
                                v6 = v2; 
                            end;
                            O[1] = w[c[5]](O[1] + O[1]);
                            O[2] = w[c[5]](O[2] + O[2]);
                            O[3] = w[c[5]](O[3] + O[3]);
                            O[4] = w[c[5]](O[4] + O[4]);
                            O[5] = w[c[5]](O[5] + O[5]);
                            O[6] = w[c[5]](O[6] + O[6]);
                            O[7] = w[c[5]](O[7] + O[7]);
                            O[8] = w[c[5]](O[8] + O[8]);
                            return; 
                        end;
                        return (function(arg1_71, ...)
                            local c = {
                                76,
                                77,
                                78,
                                74,
                                75
                            };
                            v1 = arg1_71;
                            v1 = w[c[1]](v1, #v1);
                            U = w[c[2]]({});
                            for E = 1, #v1, 64 do
                                w[c[3]](v1, E, U); 
                            end;
                            return w[c[4]](w[c[5]](U[1], 4) .. w[c[5]](U[2], 4) .. w[c[5]](U[3], 4) .. w[c[5]](U[4], 4) .. w[c[5]](U[5], 4) .. w[c[5]](U[6], 4) .. w[c[5]](U[7], 4) .. w[c[5]](U[8], 4)); 
                        end)(arg1_49); 
                    end
                }; 
            end;
            r74.c = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                return {
                    ["\x00padString"] = function(arg1_72, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_72;
                        U = v1.sub(v1, 1, math.floor(#v1 / 16) * 16);
                        O = 16 - #U % 16 and 0;
                        v5 = O == 16;
                        return U .. string.rep("0", O); 
                    end,
                    ["\x00strToHex"] = function(arg1_73, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_73;
                        return v1.gsub(v1, ".", function(arg1_74, ...)
                            local c = {
                                c[1],
                                c[2]
                            };
                            v1 = arg1_74;
                            return string.format("%02x", v1.byte(v1)); 
                        end); 
                    end,
                    ["\x00hexToBin"] = function(arg1_75, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_75;
                        return v1.gsub(v1, "..", function(arg1_76, ...)
                            local c = {
                                c[1],
                                c[2]
                            };
                            return string.char(tonumber(arg1_76, 16)); 
                        end); 
                    end,
                    ["\x00bytesToHex"] = function(arg1_77, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_77;
                        for O = 0, #v1 do
                            if v1[O] then
                                U = U .. string.format("%02x", arg1_77[O]);
                            end; 
                        end;
                        return ""; 
                    end,
                    ["\x00hexToBytes"] = function(arg1_78, ...)
                        v1 = arg1_78;
                        U = {};
                        O = 0;
                        for E = 1, #v1, 2 do
                            U[O] = tonumber(v1.sub(v1, E, E + 1), 16);
                            O = O + 1; 
                        end;
                        return U; 
                    end
                }; 
            end;
            r74.d = function(...)
                local c = {
                    c[1],
                    c[2],
                    118,
                    111,
                    112
                };
                local function v1(...)
                    local c = {
                        c[1],
                        c[2],
                        c[3],
                        c[4],
                        c[5]
                    };
                    r139 = {};
                    local function r140(arg1_79, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[3]
                        };
                        v1 = arg1_79;
                        if type(v1) ~= "table" then
                            return type(v1);
                        end;
                        G = {
                            w[c[3]](v1)
                        };
                        G = G[1];
                        E = G(G[2], G[3]);
                        while E do
                            v4 = G(O, G[3]);
                            if v1[1] ~= nil then
                                U = 1 + 1;
                            end;
                            return "table"; 
                        end;
                        if 1 == 1 then
                            return "table";
                        end;
                        return "array"; 
                    end;
                    local function r141(arg1_80, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v4 = "f";
                        E = v4[2];
                        G = v4[3];
                        v4 = "ipairs";
                        for G, v6 in ipairs({
                            "\\",
                            "\"",
                            "/",
                            "\x08",
                            "\x0c",
                            "\n",
                            "\r",
                            "\t"
                        }) do
                            v1 = v1.gsub(v1, v6, "\\" .. ({
                                "\\",
                                "\"",
                                "/",
                                "b",
                                v4,
                                "n",
                                "r",
                                "t"
                            })[G]); 
                        end;
                        return arg1_80; 
                    end;
                    local function r142(arg1_81, arg2_81, arg3_81, arg4_81, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4]
                        };
                        v1 = arg1_81;
                        U = arg2_81;
                        U = U + #v1.match(v1, "^%s*", U);
                        if v1.sub(v1, U, U) ~= arg3_81 then
                            if arg4_81 then
                                w[c[3]]("Expected " .. arg3_81 .. " near position " .. v5);
                            end;
                            return U, false;
                        end;
                        return U + 1, true; 
                    end;
                    local function r143(arg1_82, arg2_82, arg3_82, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4],
                            G
                        };
                        v1 = arg1_82;
                        U = arg2_82;
                        O = arg3_82;
                        if O then
                            O = O;
                            E = "End of input found while parsing string.";
                            if U > #v1 then
                                w[c[4]](E);
                            end;
                            G = v1.sub(v1, U, U);
                            if G == "\"" then
                                return O, arg2_82 + 1;
                            end;
                            if G ~= "\\" then
                                return w[G](arg1_82, arg2_82 + 1, O .. G);
                            end;
                            v2 = v1.sub(v1, U + 1, U + 1);
                            if not v2 then
                                w[c[4]](E);
                            end;
                            v5 = w[c[4]];
                            v7 = ({
                                ["b"] = "\x08",
                                ["f"] = "\x0c",
                                ["n"] = "\n",
                                ["r"] = "\r",
                                ["t"] = "\t"
                            })[v2];
                            if v7 then
                                v5 = v5;
                                return v5(arg1_82, U + 2, O .. v7);
                            else
                                i = v1.sub(v1, U + 1, v6);
                            end;
                        else
                            v3 = "";
                        end; 
                    end;
                    local function r144(arg1_83, arg2_83, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4]
                        };
                        U = arg2_83;
                        v1 = arg1_83;
                        O = v1.match(v1, "^-?%d+%.?%d*[eE]?[+-]?%d*", U);
                        E = tonumber(O);
                        if not E then
                            w[c[3]]("Error parsing number at position " .. U .. ".");
                        end;
                        return E, U + #O; 
                    end;
                    r139.stringify = function(arg1_84, arg2_84, ...)
                        local c = {
                            91,
                            c[1],
                            c[2],
                            c[4],
                            89,
                            c[3],
                            92,
                            c[5]
                        };
                        U = arg2_84;
                        v1 = arg1_84;
                        O = {};
                        E = w[c[1]](v1);
                        if E == "array" then
                            if U then
                                w[c[4]]("Can't encode array as key.");
                            end;
                            v2 = w[c[3]];
                            table.insert(O, "[");
                            G = v2[2];
                            v2 = v2[1];
                            for v4, d in ipairs(v1) do
                                if v4 > 1 then
                                    table.insert({}, ",");
                                end;
                                table.insert({}, w[c[5]].stringify(d)); 
                            end;
                            table.insert(O, "]");
                        else
                            if E == "table" then
                                if arg2_84 then
                                    w[c[4]]("Can't encode table as key.");
                                end;
                                d = w[c[3]]("x", 6706085284914);
                                table.insert(O, w[c[2]][d]);
                                G = true;
                                v4 = d[1];
                                v2 = d[2];
                                for v6, b in w[c[6]](arg1_84) do
                                    if not true then
                                        table.insert({}, ",");
                                    end;
                                    G = false;
                                    table.insert(O, w[c[5]].stringify(v6, true));
                                    table.insert(O, ":");
                                    table.insert(O, w[c[5]].stringify(b)); 
                                end;
                                table.insert(O, "}");
                            else
                                if E == "string" then
                                    return "\"" .. w[c[7]](arg1_84) .. "\"";
                                end;
                                if E == "number" then
                                    if U then
                                        v2 = "\"" .. w[c[8]](arg1_84) .. "\"";
                                    end;
                                    v5 = v5;
                                    if U then
                                        v5 = v5;
                                        return U;
                                    else
                                        w[c[5]](arg1_84);
                                    end;
                                end;
                                if E == "boolean" then
                                    return w[c[5]](arg1_84);
                                end;
                                if E == "nil" then
                                    return "null";
                                end;
                                if E == "userdata" then
                                    return "\"" .. w[c[8]](arg1_84) .. "\"";
                                end;
                                w[c[4]]("Unjsonifiable type: " .. E);
                                return (function(arg1_85, arg2_85, arg3_85, arg4_85, ...)
                                    local c = {
                                        c[2],
                                        c[3]
                                    };
                                    v1 = arg1_85;
                                    O = arg3_85;
                                    U = arg2_85;
                                    E = arg4_85;
                                    if U then
                                        U = U;
                                        v2 = E == G;
                                        if E then
                                            v5 = v5;
                                            E = E;
                                            for d = arg3_85 or 1, E do
                                                v2 = w[c[1]][w[c[2]](i, M)] .. tostring(arg1_85[d]);
                                                if d < E then
                                                    v2 = v7 .. v3;
                                                end; 
                                            end;
                                            return "";
                                        else
                                            v4 = #arg1_85;
                                        end;
                                    else
                                        v3 = "";
                                    end; 
                                end)({});
                            end;
                        end; 
                    end;
                    r139.null = {};
                    r139.parse = function(arg1_86, arg2_86, arg3_86, ...)
                        local c = {
                            c[4],
                            c[1],
                            c[2],
                            89,
                            94,
                            90,
                            93,
                            c[3]
                        };
                        v1 = arg1_86;
                        U = arg2_86 or 1;
                        O = arg3_86;
                        if U > #v1 then
                            w[c[1]]("Reached unexpected end of input.");
                        end;
                        E = v1.sub(v1, U, U);
                        if E == "{" then
                            v2 = true;
                            U = v3 + 1;
                            while true do
                                F = 33692872867145;
                                v7 = {
                                    w[c[4]].parse(v1, v6, w[c[2]][w[c[3]]("B", F)])
                                };
                                v4 = v7[1];
                                if v4 == nil then
                                    return {}, v7[2];
                                else
                                    if not true then
                                        w[c[1]]("Comma missing between object items.");
                                    end;
                                    U = w[c[5]](v1, i, ":", true);
                                    e = {
                                        w[c[4]].parse(v1, U)
                                    };
                                    U = e[2];
                                    ({})[v4] = e[1];
                                    F = {
                                        w[c[5]](v1, U, ",")
                                    };
                                    v2 = F[2];
                                    U = F[1];
                                end; 
                            end;
                        else
                            if E == "[" then
                                v2 = true;
                                U = v3 + 1;
                                while true do
                                    X = w[c[3]]("\xcb", 15038313880410);
                                    H = {
                                        w[c[4]].parse(arg1_86, d, w[c[2]][X])
                                    };
                                    v4 = H[1];
                                    if v4 == nil then
                                        return {}, H[2];
                                    else
                                        if not true then
                                            w[c[1]]("Comma missing between array items.");
                                        end;
                                        table.insert({}, v4);
                                        X = {
                                            w[c[5]](arg1_86, u, ",")
                                        };
                                        U = X[1];
                                        v2 = X[2];
                                    end; 
                                end;
                            else
                                if E == "\"" then
                                    return r143(arg1_86, v3 + 1);
                                end;
                                v5 = w[v1];
                                if E == "-" or E.match(E, "%d") then
                                    return r144(arg1_86, v3);
                                end;
                                if E == arg3_86 then
                                    return nil, v3 + 1;
                                end;
                                X = "true";
                                v4 = X[1];
                                v2 = X[2];
                                for l, n in w[c[8]](n) do
                                    if v1.sub(v1, v3, v3 + #l - 1) == l then
                                        return n, v3 + #l;
                                    else
                                        
                                    end; 
                                end;
                                w[c[1]]("Invalid json syntax at position " .. v3);
                                return;
                            end;
                        end; 
                    end;
                    return r139; 
                end;
                return v1; 
            end;
            r74.e = function(...)
                local c = {
                    c[1],
                    c[2],
                    114
                };
                r145 = {
                    ["cache"] = {}
                };
                r145.__index = r145;
                r145.add = function(arg1_87, arg2_87, arg3_87, arg4_87, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    E = arg4_87;
                    if E then
                        G = os.time() + E;
                    end;
                    v5 = w[v1];
                    arg1_87.cache[arg2_87] = {
                        ["value"] = arg3_87,
                        ["expiration"] = E or nil
                    };
                    return; 
                end;
                r145.get = function(arg1_88, arg2_88, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    O = arg1_88.cache[arg2_88];
                    if O then
                        if O.expiration and os.time() > O.expiration then
                            arg1_88.cache[arg2_88] = nil;
                            return nil;
                        end;
                        return O.value;
                    end;
                    return nil; 
                end;
                r145.remove = function(arg1_89, arg2_89, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    arg1_89.cache[arg2_89] = nil;
                    return; 
                end;
                r145.clear = function(arg1_90, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    arg1_90.cache = {};
                    return; 
                end;
                r145.new = function(...)
                    local c = {
                        c[3],
                        104,
                        c[1],
                        c[2]
                    };
                    v1 = w[c[1]]({}, w[c[2]]);
                    v1.cache = {};
                    return v1; 
                end;
                return r145; 
            end;
            r74.f = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                return {
                    ["\x00generateSeed"] = function(...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        return (os.time() * 1664525 + os.clock() + math.floor(math.random() * 1000000)) % 4294967296; 
                    end,
                    ["\x00lcg"] = function(arg1_91, arg2_91, arg3_91, arg4_91, ...)
                        O = arg3_91;
                        G = {};
                        b = arg2_91;
                        v6 = 4294967296;
                        d = arg1_91;
                        for i = 1, b do
                            G[i] = O + (1664525 * v1 + 1013904223) % v6 % (arg4_91 - O + 1); 
                        end;
                        return G; 
                    end,
                    ["\x00sign"] = function(arg1_92, arg2_92, ...)
                        return arg1_92 + (#arg2_92 % 1000) ^ 2; 
                    end
                }; 
            end;
            r74.v5 = function(...)
                local c = {
                    c[1],
                    c[2],
                    118,
                    111,
                    112
                };
                local function v1(...)
                    local c = {
                        c[1],
                        c[2],
                        c[3],
                        c[4],
                        c[5]
                    };
                    r146 = {};
                    local function r147(arg1_93, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[3]
                        };
                        v1 = arg1_93;
                        if type(v1) ~= "table" then
                            return type(v1);
                        end;
                        G = {
                            w[c[3]](v1)
                        };
                        G = G[1];
                        E = G(G[2], G[3]);
                        while E do
                            v4 = G(O, G[3]);
                            if v1[1] ~= nil then
                                U = 1 + 1;
                            end;
                            return "table"; 
                        end;
                        if 1 == 1 then
                            return "table";
                        end;
                        return "array"; 
                    end;
                    local function r148(arg1_94, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v4 = "f";
                        E = v4[2];
                        v4 = v4[1];
                        for G, v6 in ipairs({
                            "\\",
                            "\"",
                            "/",
                            "\x08",
                            "\x0c",
                            "\n",
                            "\r",
                            "\t"
                        }) do
                            v1 = v1.gsub(v1, v6, "\\" .. ({
                                "\\",
                                "\"",
                                "/",
                                "b",
                                v4,
                                "n",
                                "r",
                                "t"
                            })[G]); 
                        end;
                        return arg1_94; 
                    end;
                    local function r149(arg1_95, arg2_95, arg3_95, arg4_95, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4]
                        };
                        U = arg2_95;
                        v1 = arg1_95;
                        U = U + #v1.match(v1, "^%s*", U);
                        if v1.sub(v1, U, U) ~= arg3_95 then
                            if arg4_95 then
                                w[c[3]]("Expected " .. arg3_95 .. " near position " .. v5);
                            end;
                            return U, false;
                        end;
                        return U + 1, true; 
                    end;
                    local function r150(arg1_96, arg2_96, arg3_96, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4],
                            G
                        };
                        v1 = arg1_96;
                        U = arg2_96;
                        O = arg3_96;
                        if O then
                            O = O;
                            E = "End of input found while parsing string.";
                            if U > #v1 then
                                w[c[4]](E);
                            end;
                            G = v1.sub(v1, U, U);
                            if G == "\"" then
                                return O, arg2_96 + 1;
                            end;
                            if G ~= "\\" then
                                return w[G](arg1_96, arg2_96 + 1, O .. G);
                            end;
                            v2 = v1.sub(v1, U + 1, U + 1);
                            if not v2 then
                                w[c[4]](E);
                            end;
                            v5 = w[c[4]];
                            v7 = ({
                                ["b"] = "\x08",
                                ["f"] = "\x0c",
                                ["n"] = "\n",
                                ["r"] = "\r",
                                ["t"] = "\t"
                            })[v2];
                            if v7 then
                                v5 = v5;
                                return v5(arg1_96, U + 2, O .. v7);
                            else
                                i = v1.sub(v1, U + 1, v6);
                            end;
                        else
                            v3 = "";
                        end; 
                    end;
                    local function r151(arg1_97, arg2_97, ...)
                        local c = {
                            c[1],
                            c[2],
                            c[4]
                        };
                        U = arg2_97;
                        v1 = arg1_97;
                        O = v1.match(v1, "^-?%d+%.?%d*[eE]?[+-]?%d*", U);
                        E = tonumber(O);
                        if not E then
                            w[c[3]]("Error parsing number at position " .. U .. ".");
                        end;
                        return E, U + #O; 
                    end;
                    r146.stringify = function(arg1_98, arg2_98, ...)
                        local c = {
                            205,
                            c[1],
                            c[2],
                            c[4],
                            201,
                            c[3],
                            202,
                            c[5]
                        };
                        v1 = arg1_98;
                        O = {};
                        E = w[c[1]](v1);
                        if E == "array" then
                            if arg2_98 then
                                w[c[4]]("Can't encode array as key.");
                            end;
                            v2 = w[c[3]];
                            table.insert(O, "[");
                            G = v2[2];
                            v4 = v2[3];
                            v2 = "ipairs";
                            for v4, d in ipairs(v1) do
                                if v4 > 1 then
                                    table.insert({}, ",");
                                end;
                                table.insert({}, w[c[5]].stringify(d)); 
                            end;
                            table.insert(O, "]");
                        else
                            if E == "table" then
                                if arg2_98 then
                                    w[c[4]]("Can't encode table as key.");
                                end;
                                d = w[c[3]]("\xfe", 15261303856066);
                                table.insert(O, w[c[2]][d]);
                                G = true;
                                v2 = d[2];
                                v6 = d[3];
                                for v6, b in w[c[6]](arg1_98) do
                                    if not true then
                                        table.insert({}, ",");
                                    end;
                                    G = false;
                                    table.insert(O, w[c[5]].stringify(v6, true));
                                    table.insert(O, ":");
                                    table.insert(O, w[c[5]].stringify(b)); 
                                end;
                                table.insert(O, "}");
                            else
                                if E == "string" then
                                    return "\"" .. w[c[7]](arg1_98) .. "\"";
                                end;
                                v2 = w[c[2]];
                                if E == "number" then
                                    v2 = arg2_98;
                                    v5 = v5;
                                    if v2 then
                                        v5 = v5;
                                        return v2 and "\"" .. w[c[8]](arg1_98) .. "\"";
                                    else
                                        w[c[5]](arg1_98);
                                    end;
                                end;
                                if E == "boolean" then
                                    return w[c[5]](arg1_98);
                                end;
                                if E == "nil" then
                                    return "null";
                                end;
                                if E == "userdata" then
                                    return "\"" .. w[c[8]](arg1_98) .. "\"";
                                end;
                                w[c[4]]("Unjsonifiable type: " .. E);
                                return (function(arg1_99, arg2_99, arg3_99, arg4_99, ...)
                                    local c = {
                                        c[2],
                                        c[3]
                                    };
                                    v1 = arg1_99;
                                    U = arg2_99;
                                    E = arg4_99;
                                    O = arg3_99;
                                    if U then
                                        v2 = E == G;
                                        U = U;
                                        if E then
                                            E = E;
                                            v5 = v5;
                                            for d = arg3_99 or 1, E do
                                                v2 = w[c[1]][w[c[2]](i, M)] .. tostring(arg1_99[d]);
                                                if d < E then
                                                    v2 = v7 .. v3;
                                                end; 
                                            end;
                                            return "";
                                        else
                                            v4 = #arg1_99;
                                        end;
                                    else
                                        v3 = "";
                                    end; 
                                end)({});
                            end;
                        end; 
                    end;
                    r146.null = {};
                    r146.parse = function(arg1_100, arg2_100, arg3_100, ...)
                        local c = {
                            c[4],
                            c[1],
                            c[2],
                            201,
                            203,
                            206,
                            204,
                            c[3]
                        };
                        O = arg3_100;
                        v1 = arg1_100;
                        U = arg2_100 or 1;
                        if U > #v1 then
                            w[c[1]]("Reached unexpected end of input.");
                        end;
                        E = v1.sub(v1, U, U);
                        if E == "{" then
                            v2 = true;
                            U = v3 + 1;
                            while true do
                                F = 8122971131590;
                                v7 = {
                                    w[c[4]].parse(v1, v6, w[c[2]][w[c[3]]("I", F)])
                                };
                                v4 = v7[1];
                                if v4 == nil then
                                    return {}, v7[2];
                                else
                                    if not true then
                                        w[c[1]]("Comma missing between object items.");
                                    end;
                                    U = w[c[5]](v1, i, ":", true);
                                    e = {
                                        w[c[4]].parse(v1, U)
                                    };
                                    ({})[v4] = e[1];
                                    U = e[2];
                                    F = {
                                        w[c[5]](v1, U, ",")
                                    };
                                    U = F[1];
                                    v2 = F[2];
                                end; 
                            end;
                        else
                            if E == "[" then
                                v2 = true;
                                U = v3 + 1;
                                while true do
                                    X = w[c[3]]("\xec", 21497071839002);
                                    H = {
                                        w[c[4]].parse(arg1_100, d, w[c[2]][X])
                                    };
                                    v4 = H[1];
                                    if v4 == nil then
                                        return {}, H[2];
                                    else
                                        if not true then
                                            w[c[1]]("Comma missing between array items.");
                                        end;
                                        table.insert({}, v4);
                                        X = {
                                            w[c[5]](arg1_100, u, ",")
                                        };
                                        U = X[1];
                                        v2 = X[2];
                                    end; 
                                end;
                            else
                                if E == "\"" then
                                    return r150(arg1_100, v3 + 1);
                                end;
                                v5 = w[v1];
                                if E == "-" or E.match(E, "%d") then
                                    return r151(arg1_100, v3);
                                end;
                                if E == arg3_100 then
                                    return nil, v3 + 1;
                                end;
                                X = "true";
                                v2 = X[2];
                                l = X[3];
                                for l, n in w[c[8]](n) do
                                    if v1.sub(v1, v3, v3 + #l - 1) == l then
                                        return n, v3 + #l;
                                    else
                                        
                                    end; 
                                end;
                                w[c[1]]("Invalid json syntax at position " .. v3);
                                return;
                            end;
                        end; 
                    end;
                    return r146; 
                end;
                return v1; 
            end;
            r74.h = function(...)
                local c = {
                    c[1],
                    c[2],
                    130,
                    132,
                    113,
                    140,
                    122,
                    135,
                    128,
                    129,
                    133,
                    111,
                    137,
                    123,
                    134,
                    141,
                    138,
                    139,
                    121,
                    136,
                    127,
                    120,
                    119,
                    131,
                    114
                };
                return {
                    ["\x00AES"] = function(arg1_101, ...)
                        local c = {
                            c[3],
                            c[1],
                            c[2],
                            c[4],
                            c[5],
                            c[6],
                            c[7],
                            c[8],
                            c[9],
                            c[10],
                            c[11],
                            c[12],
                            c[13],
                            c[14],
                            c[15],
                            c[16],
                            c[17],
                            c[18],
                            c[19],
                            c[20],
                            c[21],
                            c[22],
                            c[23],
                            c[24]
                        };
                        r152 = w[c[1]](131072);
                        r153 = w[c[1]](65536);
                        r154 = w[c[1]](65536);
                        r155 = w[c[1]](65536);
                        r156 = w[c[1]](65536);
                        r157 = w[c[1]](65536);
                        r158 = {
                            ["FwdMode"] = function(arg1_102, arg2_102, arg3_102, arg4_102, arg5_102, arg6_102, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[6],
                                    c[7],
                                    c[8]
                                };
                                v1 = arg1_102;
                                G = arg5_102;
                                v4 = arg6_102;
                                E = arg4_102;
                                U = arg2_102;
                                w[c[2]]((w[c[1]](arg3_102) - 16) % 16 == 0, "Input length must be a multiple of 16 bytes");
                                if v4 then
                                    v4 = v4;
                                    w[c[2]](w[c[1]](v4) == 16, "Initialization vector must be 16 bytes long");
                                    w[c[6]](E, 0, w[c[7]](w[c[8]](O, 0), w[c[8]](v4, 0)));
                                    w[c[6]](E, 4, w[c[7]](w[c[8]](O, 4), w[c[8]](v4, 4)));
                                    w[c[6]](E, 8, w[c[7]](w[c[8]](O, 8), w[c[8]](v4, 8)));
                                    w[c[6]](E, 12, w[c[7]](w[c[8]](O, 12), w[c[8]](v4, 12)));
                                    arg1_102(E, 0, E, 0);
                                    for b = 16, w[c[1]](O) - 16, 16 do
                                        w[c[6]](E, b, w[c[7]](w[c[8]](O, b), w[c[8]](E, b - 16)));
                                        w[c[6]](E, b + 4, w[c[7]](w[c[8]](O, b + 4), w[c[8]](E, b - 12)));
                                        w[c[6]](E, b + 8, w[c[7]](w[c[8]](O, b + 8), w[c[8]](E, b - 8)));
                                        w[c[6]](E, b + 12, w[c[7]](w[c[8]](O, b + 12), w[c[8]](E, b - 4)));
                                        arg1_102(E, b, E, b); 
                                    end;
                                    return;
                                else
                                    w[c[5]](16);
                                end; 
                            end,
                            ["InvMode"] = function(arg1_103, arg2_103, arg3_103, arg4_103, arg5_103, arg6_103, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[8],
                                    c[6],
                                    c[7]
                                };
                                v1 = arg1_103;
                                v4 = arg6_103;
                                E = arg4_103;
                                G = arg5_103;
                                U = arg2_103;
                                w[c[2]]((w[c[1]](arg3_103) - 16) % 16 == 0, "Input length must be a multiple of 16 bytes");
                                if v4 then
                                    v4 = v4;
                                    w[c[2]](w[c[1]](v4) == 16, "Initialization vector must be 16 bytes long");
                                    w[c[6]](O, 0);
                                    w[c[6]](O, 4);
                                    w[c[6]](O, 8);
                                    w[c[6]](O, 12);
                                    arg2_103(O, 0, E, 0);
                                    w[c[7]](E, 0, w[c[8]](w[c[6]](E, 0), w[c[6]](v4, 0)));
                                    w[c[7]](E, 4, w[c[8]](w[c[6]](E, 4), w[c[6]](v4, 4)));
                                    w[c[7]](E, 8, w[c[8]](w[c[6]](E, 8), w[c[6]](v4, 8)));
                                    v5 = w[c[7]];
                                    v5(E, 12, w[c[8]](w[c[6]](E, 12), w[c[6]](v4, 12)));
                                    for u = 16, w[c[1]](O) - 16, 16 do
                                        e = w[c[6]](O, u);
                                        v7 = w[c[6]](O, u + 8);
                                        M = w[c[6]](O, u + 4);
                                        arg2_103(O, u, E, u);
                                        v8 = w[c[6]](O, u + 12);
                                        w[c[7]](E, u, w[c[8]](w[c[6]](E, u), w[c[6]](O, 0)));
                                        w[c[7]](E, u + 4, w[c[8]](w[c[6]](E, u + 4), w[c[6]](O, 4)));
                                        w[c[7]](E, u + 8, w[c[8]](w[c[6]](E, u + 8), w[c[6]](O, 8)));
                                        w[c[7]](E, u + 12, w[c[8]](w[c[6]](E, u + 12), w[c[6]](O, 12)));
                                        I = w[c[6]](O, u + 8);
                                        P = w[c[6]](O, u + 4);
                                        d = w[c[6]](O, u + 4);
                                        b = w[c[6]](O, u + 8);
                                        v5 = w[c[6]](O, u);
                                        v6 = w[c[6]](O, u);
                                        cc = w[c[6]](O, u + 12);
                                        i = w[c[6]](O, u + 12); 
                                    end;
                                    return;
                                else
                                    w[c[5]](16);
                                end; 
                            end
                        };
                        r159 = {
                            ["Pad"] = function(arg1_104, arg2_104, arg3_104, ...)
                                local c = {
                                    c[4],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[1],
                                    c[9],
                                    c[10]
                                };
                                v1 = arg1_104;
                                U = arg2_104;
                                E = w[c[1]](v1);
                                O = arg3_104;
                                if U then
                                    w[c[2]](w[c[1]](U) >= E + O, "Output buffer out of bounds");
                                else
                                    U = w[c[5]](E - E % O + O);
                                end;
                                v4 = O - E % O;
                                w[c[6]](U, 0, v1, 0, E);
                                w[c[7]](U, E, v4, v4);
                                return U; 
                            end,
                            ["Unpad"] = function(arg1_105, arg2_105, arg3_105, ...)
                                local c = {
                                    c[4],
                                    c[11],
                                    c[5],
                                    c[2],
                                    c[3],
                                    c[12],
                                    c[1],
                                    c[9]
                                };
                                v1 = arg1_105;
                                U = arg2_105;
                                E = w[c[1]](v1);
                                G = w[c[2]](v1, E - 1);
                                v4 = E - G;
                                d = 0 < G;
                                v2 = w[c[4]];
                                if d then
                                    v2 = G <= arg3_105;
                                end;
                                b = w[c[5]];
                                v2 = 2;
                                v2 = w[c[3]](v2, "Got unexpected padding");
                                v6 = 1;
                                v3 = 0;
                                for v3 = E, v2, v2 do
                                    v3 = w[c[2]];
                                    i = w[c[5]];
                                    if v3(v1, i) ~= G then
                                        w[c[6]]("Got unexpected padding");
                                    end; 
                                end;
                                if U then
                                    w[c[3]](w[c[1]](U) >= v4, "Output buffer out of bounds");
                                else
                                    U = w[c[7]](v4);
                                end;
                                w[c[8]](U, 0, v1, 0, v4);
                                return U; 
                            end,
                            ["Overwrite"] = nil
                        };
                        local function r160(arg1_106, arg2_106, arg3_106, arg4_106, ...)
                            local c = {
                                c[9],
                                c[13],
                                c[14],
                                c[8],
                                c[7],
                                c[15],
                                176,
                                c[16],
                                c[6]
                            };
                            O = arg3_106;
                            v1 = arg1_106;
                            U = arg2_106;
                            if arg4_106 then
                                w[c[1]](O, 0, v1, 0, U);
                            else
                                w[c[2]](O, 0, v1, U);
                            end;
                            G = w[c[3]](w[c[4]](O, U - 4), 8);
                            v4 = 0.5;
                            if U == 32 then
                                for o = 32, 192, 32 do
                                    G = w[c[5]](w[c[4]](O, v2 - 32), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 0.5 * 2 % 229);
                                    w[c[9]](O, v2, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 28), G);
                                    w[c[9]](O, v2 + 4, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 24), G);
                                    w[c[9]](O, v2 + 8, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 20), G);
                                    w[c[9]](O, v2 + 12, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 16), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2));
                                    w[c[9]](O, v2 + 16, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 12), G);
                                    w[c[9]](O, v2 + 20, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 8), G);
                                    w[c[9]](O, v2 + 24, G);
                                    G = w[c[5]](w[c[4]](O, v2 - 4), G);
                                    w[c[9]](O, v2 + 28, G);
                                    G = w[c[3]](G, 8); 
                                end;
                                G = w[c[5]](w[c[4]](O, 192), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 64);
                                w[c[9]](O, 224, G);
                                G = w[c[5]](w[c[4]](O, 196), G);
                                w[c[9]](O, 228, G);
                                G = w[c[5]](w[c[4]](O, 200), G);
                                w[c[9]](O, 232, G);
                                w[c[9]](O, 236, w[c[5]](w[c[4]](O, 204), G));
                            else
                                if U == 24 then
                                    for b = 24, 168, 24 do
                                        G = w[c[5]](w[c[4]](O, b - 24), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 0.5 * 2 % 229);
                                        w[c[9]](O, b, G);
                                        G = w[c[5]](w[c[4]](O, b - 20), G);
                                        w[c[9]](O, b + 4, G);
                                        G = w[c[5]](w[c[4]](O, b - 16), G);
                                        w[c[9]](O, b + 8, G);
                                        G = w[c[5]](w[c[4]](O, b - 12), G);
                                        w[c[9]](O, b + 12, G);
                                        G = w[c[5]](w[c[4]](O, b - 8), G);
                                        w[c[9]](O, b + 16, G);
                                        G = w[c[5]](w[c[4]](O, b - 4), G);
                                        w[c[9]](O, b + 20, G);
                                        G = w[c[3]](G, 8); 
                                    end;
                                    G = w[c[5]](w[c[4]](O, 168), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 128);
                                    w[c[9]](O, 192, G);
                                    G = w[c[5]](w[c[4]](O, 172), G);
                                    w[c[9]](O, 196, G);
                                    G = w[c[5]](w[c[4]](O, 176), G);
                                    w[c[9]](O, 200, G);
                                    w[c[9]](O, 204, w[c[5]](w[c[4]](O, 180), G));
                                else
                                    for X = 16, 144, 16 do
                                        G = w[c[5]](w[c[4]](O, X - 16), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 0.5 * 2 % 229);
                                        w[c[9]](O, X, G);
                                        G = w[c[5]](w[c[4]](O, X - 12), G);
                                        w[c[9]](O, X + 4, G);
                                        G = w[c[5]](w[c[4]](O, X - 8), G);
                                        w[c[9]](O, X + 8, G);
                                        G = w[c[5]](w[c[4]](O, X - 4), G);
                                        w[c[9]](O, X + 12, G);
                                        G = w[c[3]](G, 8); 
                                    end;
                                    G = w[c[5]](w[c[4]](O, 144), w[c[6]](w[c[7]], w[c[8]](G / 65536) * 2) * 65536 + w[c[6]](w[c[7]], G % 65536 * 2), 54);
                                    w[c[9]](O, 160, G);
                                    G = w[c[5]](w[c[4]](O, 148), G);
                                    w[c[9]](O, 164, G);
                                    G = w[c[5]](w[c[4]](O, 152), G);
                                    w[c[9]](O, 168, G);
                                    w[c[9]](O, 172, w[c[5]](w[c[4]](O, 156), G));
                                    return O;
                                end;
                            end; 
                        end;
                        local function r161(arg1_107, arg2_107, arg3_107, arg4_107, arg5_107, arg6_107, ...)
                            local c = {
                                c[7],
                                c[11],
                                177,
                                178,
                                c[6],
                                c[15],
                                176,
                                c[8]
                            };
                            U = arg2_107;
                            E = arg4_107;
                            v4 = arg6_107;
                            O = arg3_107;
                            v1 = arg1_107;
                            G = arg5_107;
                            v2 = w[c[1]](w[c[2]](O, E), w[c[2]](v1, 0));
                            v6 = w[c[1]](w[c[2]](O, E + 1), w[c[2]](v1, 1));
                            d = w[c[1]](w[c[2]](O, E + 2), w[c[2]](v1, 2));
                            b = w[c[1]](w[c[2]](O, E + 3), w[c[2]](v1, 3));
                            i = w[c[1]](w[c[2]](O, E + 4), w[c[2]](v1, 4));
                            M = w[c[1]](w[c[2]](O, E + 5), w[c[2]](v1, 5));
                            v7 = w[c[1]](w[c[2]](O, E + 6), w[c[2]](v1, 6));
                            v8 = w[c[1]](w[c[2]](O, E + 7), w[c[2]](v1, 7));
                            e = w[c[1]](w[c[2]](O, E + 8), w[c[2]](v1, 8));
                            l = w[c[1]](w[c[2]](O, E + 9), w[c[2]](v1, 9));
                            F = w[c[1]](w[c[2]](O, E + 10), w[c[2]](v1, 10));
                            u = w[c[1]](w[c[2]](O, E + 11), w[c[2]](v1, 11));
                            m = w[c[1]](w[c[2]](O, E + 12), w[c[2]](v1, 12));
                            H = w[c[1]](w[c[2]](O, E + 13), w[c[2]](v1, 13));
                            n = w[c[1]](w[c[2]](O, E + 14), w[c[2]](v1, 14));
                            X = w[c[1]](w[c[2]](O, E + 15), w[c[2]](v1, 15));
                            p = v2 * 256 + M;
                            L = M * 256 + F;
                            P = F * 256 + X;
                            I = X * 256 + v2;
                            cc = i * 256 + l;
                            sc = l * 256 + n;
                            h = n * 256 + b;
                            Zc = b * 256 + i;
                            Cc = e * 256 + H;
                            gc = H * 256 + d;
                            Sc = d * 256 + v8;
                            Jc = v8 * 256 + e;
                            fc = m * 256 + v6;
                            Qc = v6 * 256 + v7;
                            wc = v7 * 256 + u;
                            ac = u * 256 + m;
                            for Uc = 16, U, 16 do
                                v2 = w[c[1]](w[c[2]](w[c[3]], p), w[c[2]](w[c[4]], P), w[c[2]](v1, Uc));
                                v6 = w[c[1]](w[c[2]](w[c[3]], L), w[c[2]](w[c[4]], I), w[c[2]](v1, Uc + 1));
                                d = w[c[1]](w[c[2]](w[c[3]], P), w[c[2]](w[c[4]], p), w[c[2]](v1, Uc + 2));
                                b = w[c[1]](w[c[2]](w[c[3]], I), w[c[2]](w[c[4]], L), w[c[2]](v1, Uc + 3));
                                i = w[c[1]](w[c[2]](w[c[3]], cc), w[c[2]](w[c[4]], h), w[c[2]](v1, Uc + 4));
                                M = w[c[1]](w[c[2]](w[c[3]], sc), w[c[2]](w[c[4]], Zc), w[c[2]](v1, Uc + 5));
                                v7 = w[c[1]](w[c[2]](w[c[3]], h), w[c[2]](w[c[4]], cc), w[c[2]](v1, Uc + 6));
                                v8 = w[c[1]](w[c[2]](w[c[3]], Zc), w[c[2]](w[c[4]], sc), w[c[2]](v1, Uc + 7));
                                e = w[c[1]](w[c[2]](w[c[3]], Cc), w[c[2]](w[c[4]], Sc), w[c[2]](v1, Uc + 8));
                                l = w[c[1]](w[c[2]](w[c[3]], gc), w[c[2]](w[c[4]], Jc), w[c[2]](v1, Uc + 9));
                                F = w[c[1]](w[c[2]](w[c[3]], Sc), w[c[2]](w[c[4]], Cc), w[c[2]](v1, Uc + 10));
                                u = w[c[1]](w[c[2]](w[c[3]], Jc), w[c[2]](w[c[4]], gc), w[c[2]](v1, Uc + 11));
                                m = w[c[1]](w[c[2]](w[c[3]], fc), w[c[2]](w[c[4]], wc), w[c[2]](v1, Uc + 12));
                                H = w[c[1]](w[c[2]](w[c[3]], Qc), w[c[2]](w[c[4]], ac), w[c[2]](v1, Uc + 13));
                                n = w[c[1]](w[c[2]](w[c[3]], wc), w[c[2]](w[c[4]], fc), w[c[2]](v1, Uc + 14));
                                X = w[c[1]](w[c[2]](w[c[3]], ac), w[c[2]](w[c[4]], Qc), w[c[2]](v1, Uc + 15));
                                I = X * 256 + v2;
                                P = F * 256 + X;
                                L = M * 256 + F;
                                sc = l * 256 + n;
                                cc = i * 256 + l;
                                gc = H * 256 + d;
                                Cc = e * 256 + H;
                                Jc = v8 * 256 + e;
                                p = v2 * 256 + M;
                                Sc = d * 256 + v8;
                                wc = v7 * 256 + u;
                                Zc = b * 256 + i;
                                fc = m * 256 + v6;
                                ac = u * 256 + m;
                                h = n * 256 + b;
                                Qc = v6 * 256 + v7; 
                            end;
                            w[c[5]](G, v4, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], ac), w[c[2]](w[c[4]], Qc), w[c[2]](v1, U + 31)) * 512 + w[c[1]](w[c[2]](w[c[3]], Sc), w[c[2]](w[c[4]], Cc), w[c[2]](v1, U + 26)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], sc), w[c[2]](w[c[4]], Zc), w[c[2]](v1, U + 21)) * 512 + w[c[1]](w[c[2]](w[c[3]], p), w[c[2]](w[c[4]], P), w[c[2]](v1, U + 16)) * 2), w[c[8]](v1, U + 32)));
                            w[c[5]](G, v4 + 4, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], I), w[c[2]](w[c[4]], L), w[c[2]](v1, U + 19)) * 512 + w[c[1]](w[c[2]](w[c[3]], wc), w[c[2]](w[c[4]], fc), w[c[2]](v1, U + 30)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], gc), w[c[2]](w[c[4]], Jc), w[c[2]](v1, U + 25)) * 512 + w[c[1]](w[c[2]](w[c[3]], cc), w[c[2]](w[c[4]], h), w[c[2]](v1, U + 20)) * 2), w[c[8]](v1, U + 36)));
                            w[c[5]](G, v4 + 8, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Zc), w[c[2]](w[c[4]], sc), w[c[2]](v1, U + 23)) * 512 + w[c[1]](w[c[2]](w[c[3]], P), w[c[2]](w[c[4]], p), w[c[2]](v1, U + 18)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Qc), w[c[2]](w[c[4]], ac), w[c[2]](v1, U + 29)) * 512 + w[c[1]](w[c[2]](w[c[3]], Cc), w[c[2]](w[c[4]], Sc), w[c[2]](v1, U + 24)) * 2), w[c[8]](v1, U + 40)));
                            w[c[5]](G, v4 + 12, w[c[1]](w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], Jc), w[c[2]](w[c[4]], gc), w[c[2]](v1, U + 27)) * 512 + w[c[1]](w[c[2]](w[c[3]], h), w[c[2]](w[c[4]], cc), w[c[2]](v1, U + 22)) * 2) * 65536 + w[c[6]](w[c[7]], w[c[1]](w[c[2]](w[c[3]], L), w[c[2]](w[c[4]], I), w[c[2]](v1, U + 17)) * 512 + w[c[1]](w[c[2]](w[c[3]], fc), w[c[2]](w[c[4]], wc), w[c[2]](v1, U + 28)) * 2), w[c[8]](v1, U + 44)));
                            return; 
                        end;
                        local function r162(arg1_108, arg2_108, arg3_108, arg4_108, arg5_108, arg6_108, ...)
                            local c = {
                                c[7],
                                c[11],
                                179,
                                180,
                                181,
                                c[6]
                            };
                            v4 = arg6_108;
                            G = arg5_108;
                            O = arg3_108;
                            U = arg2_108;
                            v1 = arg1_108;
                            E = arg4_108;
                            v2 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E) * 256 + w[c[2]](v1, U + 32)), w[c[2]](v1, U + 16));
                            v6 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 13) * 256 + w[c[2]](v1, U + 45)), w[c[2]](v1, U + 17));
                            d = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 10) * 256 + w[c[2]](v1, U + 42)), w[c[2]](v1, U + 18));
                            b = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 7) * 256 + w[c[2]](v1, U + 39)), w[c[2]](v1, U + 19));
                            i = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 4) * 256 + w[c[2]](v1, U + 36)), w[c[2]](v1, U + 20));
                            M = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 1) * 256 + w[c[2]](v1, U + 33)), w[c[2]](v1, U + 21));
                            v7 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 14) * 256 + w[c[2]](v1, U + 46)), w[c[2]](v1, U + 22));
                            v8 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 11) * 256 + w[c[2]](v1, U + 43)), w[c[2]](v1, U + 23));
                            e = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 8) * 256 + w[c[2]](v1, U + 40)), w[c[2]](v1, U + 24));
                            l = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 5) * 256 + w[c[2]](v1, U + 37)), w[c[2]](v1, U + 25));
                            F = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 2) * 256 + w[c[2]](v1, U + 34)), w[c[2]](v1, U + 26));
                            u = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 15) * 256 + w[c[2]](v1, U + 47)), w[c[2]](v1, U + 27));
                            m = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 12) * 256 + w[c[2]](v1, U + 44)), w[c[2]](v1, U + 28));
                            H = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 9) * 256 + w[c[2]](v1, U + 41)), w[c[2]](v1, U + 29));
                            n = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 6) * 256 + w[c[2]](v1, U + 38)), w[c[2]](v1, U + 30));
                            X = w[c[1]](w[c[2]](w[c[3]], w[c[2]](O, E + 3) * 256 + w[c[2]](v1, U + 35)), w[c[2]](v1, U + 31));
                            p = v2 * 256 + v6;
                            L = v6 * 256 + d;
                            P = d * 256 + b;
                            I = b * 256 + v2;
                            cc = i * 256 + M;
                            sc = M * 256 + v7;
                            h = v7 * 256 + v8;
                            Zc = v8 * 256 + i;
                            Cc = e * 256 + l;
                            gc = l * 256 + F;
                            Sc = F * 256 + u;
                            Jc = u * 256 + e;
                            fc = m * 256 + H;
                            Qc = H * 256 + n;
                            wc = n * 256 + X;
                            ac = X * 256 + m;
                            v3 = 0;
                            for Ec = U, 16, -16 do
                                v2 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], p) * 256 + w[c[2]](w[c[5]], P)), w[c[2]](v1, Ec));
                                v6 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Qc) * 256 + w[c[2]](w[c[5]], ac)), w[c[2]](v1, Ec + 1));
                                d = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Sc) * 256 + w[c[2]](w[c[5]], Cc)), w[c[2]](v1, Ec + 2));
                                b = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Zc) * 256 + w[c[2]](w[c[5]], sc)), w[c[2]](v1, Ec + 3));
                                i = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], cc) * 256 + w[c[2]](w[c[5]], h)), w[c[2]](v1, Ec + 4));
                                M = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], L) * 256 + w[c[2]](w[c[5]], I)), w[c[2]](v1, Ec + 5));
                                v7 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], wc) * 256 + w[c[2]](w[c[5]], fc)), w[c[2]](v1, Ec + 6));
                                v8 = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Jc) * 256 + w[c[2]](w[c[5]], gc)), w[c[2]](v1, Ec + 7));
                                e = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Cc) * 256 + w[c[2]](w[c[5]], Sc)), w[c[2]](v1, Ec + 8));
                                l = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], sc) * 256 + w[c[2]](w[c[5]], Zc)), w[c[2]](v1, Ec + 9));
                                F = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], P) * 256 + w[c[2]](w[c[5]], p)), w[c[2]](v1, Ec + 10));
                                u = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], ac) * 256 + w[c[2]](w[c[5]], Qc)), w[c[2]](v1, Ec + 11));
                                m = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], fc) * 256 + w[c[2]](w[c[5]], wc)), w[c[2]](v1, Ec + 12));
                                H = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], gc) * 256 + w[c[2]](w[c[5]], Jc)), w[c[2]](v1, Ec + 13));
                                n = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], h) * 256 + w[c[2]](w[c[5]], cc)), w[c[2]](v1, Ec + 14));
                                X = w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], I) * 256 + w[c[2]](w[c[5]], L)), w[c[2]](v1, Ec + 15));
                                P = d * 256 + b;
                                cc = i * 256 + M;
                                L = v6 * 256 + d;
                                Cc = e * 256 + l;
                                p = v2 * 256 + v6;
                                sc = M * 256 + v7;
                                Zc = v8 * 256 + i;
                                fc = m * 256 + H;
                                Sc = F * 256 + u;
                                Qc = H * 256 + n;
                                I = b * 256 + v2;
                                wc = n * 256 + X;
                                Jc = u * 256 + e;
                                gc = l * 256 + F;
                                h = v7 * 256 + v8;
                                ac = X * 256 + m; 
                            end;
                            w[c[6]](G, v4, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Zc) * 256 + w[c[2]](w[c[5]], sc)), w[c[2]](v1, 3)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Sc) * 256 + w[c[2]](w[c[5]], Cc)), w[c[2]](v1, 2)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Qc) * 256 + w[c[2]](w[c[5]], ac)), w[c[2]](v1, 1)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], p) * 256 + w[c[2]](w[c[5]], P)), w[c[2]](v1, 0)));
                            w[c[6]](G, v4 + 4, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Jc) * 256 + w[c[2]](w[c[5]], gc)), w[c[2]](v1, 7)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], wc) * 256 + w[c[2]](w[c[5]], fc)), w[c[2]](v1, 6)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], L) * 256 + w[c[2]](w[c[5]], I)), w[c[2]](v1, 5)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], cc) * 256 + w[c[2]](w[c[5]], h)), w[c[2]](v1, 4)));
                            w[c[6]](G, v4 + 8, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], ac) * 256 + w[c[2]](w[c[5]], Qc)), w[c[2]](v1, 11)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], P) * 256 + w[c[2]](w[c[5]], p)), w[c[2]](v1, 10)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], sc) * 256 + w[c[2]](w[c[5]], Zc)), w[c[2]](v1, 9)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], Cc) * 256 + w[c[2]](w[c[5]], Sc)), w[c[2]](v1, 8)));
                            w[c[6]](G, v4 + 12, w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], I) * 256 + w[c[2]](w[c[5]], L)), w[c[2]](v1, 15)) * 16777216 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], h) * 256 + w[c[2]](w[c[5]], cc)), w[c[2]](v1, 14)) * 65536 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], gc) * 256 + w[c[2]](w[c[5]], Jc)), w[c[2]](v1, 13)) * 256 + w[c[1]](w[c[2]](w[c[3]], w[c[2]](w[c[4]], fc) * 256 + w[c[2]](w[c[5]], wc)), w[c[2]](v1, 12)));
                            return; 
                        end;
                        v7 = w[c[1]](256);
                        u = 1;
                        m = 1;
                        local function n(arg1_109, arg2_109, ...)
                            U = arg2_109;
                            O = 0;
                            for E = 0, 7 do
                                if U % 2 == 1 then
                                    O = w[c[7]](O, arg1_109);
                                end;
                                if arg1_109 >= 128 then
                                    w[c[7]](arg1_109 * 2 % 256, 27);
                                else
                                    v1 = arg1_109 * 2 % 256;
                                end;
                                U = w[c[16]](U / 2); 
                            end;
                            return O; 
                        end;
                        w[c[17]](v7, 0, 99);
                        for X = 1, 255 do
                            u = w[c[7]](1, 1 * 2, 1 < 128 and 0 or 27) % 256;
                            m = w[c[7]](1, 1 * 2);
                            m = w[c[7]](m, m * 4);
                            m = w[c[7]](m, m * 16) % 256;
                            if m >= 128 then
                                w[c[7]](cc, 9);
                            end;
                            H = w[c[7]](m, m % 128 * 2 + m / 128, m % 64 * 4 + m / 64, m % 32 * 8 + m / 32, m % 16 * 16 + m / 16, 99);
                            w[c[17]](v7, u, H);
                            w[c[17]](w[c[1]](256), H, u);
                            w[c[17]](w[c[1]](256), u, n(3, u));
                            w[c[17]](w[c[1]](256), u, n(9, u));
                            w[c[17]](w[c[1]](256), u, n(11, u)); 
                        end;
                        H = 0;
                        for Zc = 0, 255 do
                            u = w[c[11]](v7, Zc);
                            P = u * 256;
                            L = n(13, Zc);
                            p = n(14, Zc);
                            X = n(2, u);
                            for Ec = 0, 255 do
                                m = w[c[11]](w[c[1]](256), Ec);
                                w[c[18]](r152, v5 * 2, P + m);
                                w[c[17]](r155, v5, w[c[11]](w[c[1]](256), w[c[7]](Zc, Ec)));
                                w[c[17]](r153, v5, w[c[7]](X, w[c[11]](w[c[1]](256), m)));
                                w[c[17]](r154, v5, w[c[7]](u, m));
                                w[c[17]](r156, v5, w[c[7]](p, w[c[11]](w[c[1]](256), Ec)));
                                w[c[17]](r157, v5, w[c[7]](L, w[c[11]](w[c[1]](256), Ec)));
                                H = v5 + 1; 
                            end; 
                        end;
                        local function r163(arg1_110, arg2_110, ...)
                            local c = {
                                c[12],
                                c[2],
                                c[3]
                            };
                            v1 = arg1_110;
                            return w[c[1]](string.format("%s cannot be assigned to", tostring(arg2_110))); 
                        end;
                        local function r164(...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            return "AesCipher"; 
                        end;
                        return (function(arg1_112, arg2_112, arg3_112, ...)
                            local c = {
                                c[4],
                                c[20],
                                c[21],
                                c[12],
                                c[2],
                                c[3],
                                182,
                                184,
                                c[22],
                                c[23],
                                183,
                                186,
                                c[19],
                                c[24],
                                c[1],
                                79,
                                80
                            };
                            v1 = arg1_112;
                            O = arg3_112;
                            U = arg2_112;
                            r165 = w[c[1]](v1);
                            r168 = w[c[2]](v1);
                            if r165 == 240 then
                                r166 = 192;
                                r167 = w[c[3]](r168, 1, 32);
                            else
                                if r165 == 208 then
                                    r166 = 160;
                                    r167 = w[c[21]](r168, 1, 24);
                                else
                                    if r165 == 176 then
                                        r166 = 128;
                                        r167 = w[c[21]](r168, 1, 16);
                                    else
                                        w[c[4]]("Round keys must be either 240, 208 or 128 bytes long");
                                    end;
                                    v7 = U;
                                    r169 = arg1_112;
                                    v8 = v3 == v6;
                                    if U then
                                        r170 = U;
                                        r171 = r170.FwdMode;
                                        F = v5;
                                        r172 = r170.InvMode;
                                        X = w[c[6]];
                                        u = v5;
                                        r173 = r170.SegmentSize or 16;
                                        v7 = O;
                                        if O then
                                            v5 = v5;
                                            r174 = O;
                                            r175 = r174.Pad;
                                            r176 = r174.Unpad;
                                            r177 = w[c[9]](true);
                                            X = w[c[10]](r177);
                                            local function r178(arg1_113, arg2_113, arg3_113, arg4_113, ...)
                                                local c = {
                                                    i,
                                                    11,
                                                    51
                                                };
                                                w[c[1]](w[c[2]], w[c[3]], arg1_113, arg2_113, arg3_113, arg4_113);
                                                return; 
                                            end;
                                            local function r179(arg1_114, arg2_114, arg3_114, arg4_114, ...)
                                                local c = {
                                                    M,
                                                    11,
                                                    51
                                                };
                                                w[c[1]](w[c[2]], w[c[3]], arg1_114, arg2_114, arg3_114, arg4_114);
                                                return; 
                                            end;
                                            r180 = {
                                                ["Encrypt"] = function(arg1_115, arg2_115, arg3_115, ...)
                                                    local c = {
                                                        c[13],
                                                        c[5],
                                                        c[6],
                                                        c[14],
                                                        c[4],
                                                        147,
                                                        51,
                                                        144,
                                                        210,
                                                        208,
                                                        148,
                                                        146,
                                                        143,
                                                        207,
                                                        c[15]
                                                    };
                                                    O = arg3_115;
                                                    U = arg2_115;
                                                    v1 = arg1_115;
                                                    v5 = w[c[1]];
                                                    E = {
                                                        f(4, S(C))
                                                    };
                                                    v4 = v5;
                                                    G = v5(U);
                                                    M = w[c[3]];
                                                    v2 = G == "buffer";
                                                    v3 = v2 and ;
                                                    v5 = v5;
                                                    if v2 then
                                                        v5 = v5;
                                                        v4 = (v2 and )[1];
                                                        v2 = w[c[1]](arg3_115) == "buffer";
                                                        v3 = {
                                                            w[c[15]](0)
                                                        };
                                                        if v2 then
                                                            v3 = arg3_115;
                                                        end;
                                                        v2 = w[c[6]];
                                                        O = {
                                                            w[c[15]](0)
                                                        };
                                                        if v1 ~= v2 then
                                                            return v1.Encrypt(v1, v4, O, ...);
                                                        end;
                                                        v5 = w[c[7]];
                                                        if v5 then
                                                            v2 = w[c[8]](v4, O, w[c[9]]);
                                                            v5 = w[c[10]];
                                                            e = v5;
                                                            l = w[c[13]].Overwrite == false;
                                                            if l then
                                                                
                                                            end;
                                                            v5 = e;
                                                            v5 = v5;
                                                            v5(w[c[11]], w[c[12]], (l or )[1], v2, w[c[14]], ...);
                                                            return v2;
                                                        end;
                                                        w[c[5]]("AesCipher object's already destroyed");
                                                        return w[c[15]](0);
                                                    else
                                                        M = (G == "string" and {
                                                            w[c[4]](U)
                                                        } or {
                                                            w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                        })[1];
                                                        v5 = v6;
                                                        v5 = v6;
                                                        v3 = {
                                                            (G == "string" and {
                                                                w[c[4]](U)
                                                            } or {
                                                                w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                            })[1]
                                                        };
                                                    end; 
                                                end,
                                                ["Decrypt"] = function(arg1_116, arg2_116, arg3_116, ...)
                                                    local c = {
                                                        c[13],
                                                        c[5],
                                                        c[6],
                                                        c[14],
                                                        c[4],
                                                        147,
                                                        51,
                                                        143,
                                                        c[15],
                                                        c[1],
                                                        209,
                                                        148,
                                                        146,
                                                        207,
                                                        145,
                                                        210
                                                    };
                                                    O = arg3_116;
                                                    v5 = w[c[1]];
                                                    U = arg2_116;
                                                    v1 = arg1_116;
                                                    G = v5(U);
                                                    d = G == "buffer";
                                                    v2 = d;
                                                    if d then
                                                        v2 = {
                                                            U
                                                        };
                                                    end;
                                                    v5 = v5;
                                                    v5 = v5;
                                                    v5 = v5;
                                                    v5 = v5;
                                                    v4 = (v2 or {
                                                        (G == "string" and {
                                                            w[c[4]](U)
                                                        } or {
                                                            w[c[5]](string.format("Unable to cast %s to buffer", tostring(G)))
                                                        })[1]
                                                    })[1];
                                                    b = w[c[2]];
                                                    v2 = w[c[1]](O) == "buffer";
                                                    v3 = {
                                                        w[c[9]](0)
                                                    };
                                                    if v2 then
                                                        v3 = arg3_116;
                                                    end;
                                                    O = v2;
                                                    if v1 ~= w[c[6]] then
                                                        return v1.Decrypt(v1, v4, O, ...);
                                                    end;
                                                    if w[c[7]] then
                                                        v5 = w[c[8]].Overwrite;
                                                        d = v5;
                                                        b = v5 == nil and {
                                                            w[c[9]](w[c[10]](v4))
                                                        };
                                                        v5 = v5;
                                                        v6 = b;
                                                        if b then
                                                        end;
                                                    end;
                                                    w[c[5]]("AesCipher object's already destroyed");
                                                    return w[c[9]](0); 
                                                end,
                                                ["EncryptBlock"] = function(arg1_117, arg2_117, arg3_117, arg4_117, arg5_117, ...)
                                                    local c = {
                                                        147,
                                                        51,
                                                        c[11],
                                                        11,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    v1 = arg1_117;
                                                    E = arg4_117;
                                                    G = arg5_117;
                                                    if v1 ~= w[c[1]] then
                                                        v1.EncryptBlock(v1, arg2_117, arg3_117, E, G);
                                                    else
                                                        if w[c[2]] then
                                                            v6 = E;
                                                            d = w[c[3]];
                                                            v4 = w[c[4]];
                                                            v2 = w[c[2]];
                                                            if E then
                                                                v5 = v5;
                                                                if G then
                                                                    v5 = v5;
                                                                    v5(w[c[4]], w[c[2]], arg2_117, arg3_117, E, G);
                                                                    return;
                                                                else
                                                                    d = arg3_117;
                                                                end;
                                                            else
                                                                v6 = arg2_117;
                                                            end;
                                                        else
                                                            w[c[5]]("AesCipher object's already destroyed");
                                                        end;
                                                    end; 
                                                end,
                                                ["DecryptBlock"] = function(arg1_118, arg2_118, arg3_118, arg4_118, arg5_118, ...)
                                                    local c = {
                                                        147,
                                                        51,
                                                        c[12],
                                                        11,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    E = arg4_118;
                                                    v1 = arg1_118;
                                                    G = arg5_118;
                                                    if v1 ~= w[c[1]] then
                                                        v1.DecryptBlock(v1, arg2_118, arg3_118, E, G);
                                                    else
                                                        if w[c[2]] then
                                                            v6 = E;
                                                            d = w[c[3]];
                                                            v4 = w[c[4]];
                                                            v2 = w[c[2]];
                                                            if E then
                                                                v5 = d;
                                                                if G then
                                                                    v5 = v5;
                                                                    v5(w[c[4]], w[c[2]], arg2_118, arg3_118, E, G);
                                                                    return;
                                                                else
                                                                    d = arg3_118;
                                                                end;
                                                            else
                                                                v6 = arg2_118;
                                                            end;
                                                        else
                                                            w[c[5]]("AesCipher object's already destroyed");
                                                        end;
                                                    end; 
                                                end,
                                                ["Destroy"] = function(arg1_119, ...)
                                                    local c = {
                                                        147,
                                                        51,
                                                        50,
                                                        11,
                                                        208,
                                                        209,
                                                        207,
                                                        143,
                                                        48,
                                                        49,
                                                        c[4],
                                                        c[5],
                                                        c[6]
                                                    };
                                                    v1 = arg1_119;
                                                    if v1 ~= w[c[1]] then
                                                        v1.Destroy(v1);
                                                    else
                                                        if w[c[2]] then
                                                            w[c[3]] = nil;
                                                            w[c[4]] = nil;
                                                            w[c[2]] = nil;
                                                            w[c[5]] = nil;
                                                            w[c[6]] = nil;
                                                            w[c[7]] = nil;
                                                            w[c[8]] = nil;
                                                            w[c[9]] = nil;
                                                            w[c[10]] = nil;
                                                        else
                                                            w[c[11]]("AesCipher object's already destroyed");
                                                        end;
                                                        return;
                                                    end; 
                                                end
                                            };
                                            r181 = {
                                                ["Key"] = r167,
                                                ["RoundKeys"] = r168,
                                                ["Mode"] = r170,
                                                ["Padding"] = r174,
                                                ["Length"] = r165
                                            };
                                            X.__index = function(arg1_120, arg2_120, ...)
                                                local c = {
                                                    149,
                                                    51,
                                                    150,
                                                    c[4],
                                                    c[5],
                                                    c[6]
                                                };
                                                v1 = arg1_120;
                                                U = arg2_120;
                                                if w[c[1]][U] then
                                                    return w[c[1]][U];
                                                end;
                                                O = w[c[2]];
                                                if O and w[c[3]][U] then
                                                    return w[c[3]][U];
                                                end;
                                                if w[c[2]] then
                                                    O = "%s is not a valid member of AesCipher";
                                                    w[c[4]](O.format(O, U));
                                                else
                                                    w[c[4]]("AesCipher object's already destroyed");
                                                end;
                                                return; 
                                            end;
                                            X.__newindex = w[c[16]];
                                            X.__tostring = w[c[17]];
                                            X.__len = function(...)
                                                local c = {
                                                    49,
                                                    c[4],
                                                    c[5],
                                                    c[6]
                                                };
                                                v1 = w[c[1]];
                                                if v1 then
                                                    return v1;
                                                else
                                                    w[c[2]]("AesCipher object's destroyed");
                                                end; 
                                            end;
                                            X.__metatable = "AesCipher object: Metatable's locked";
                                            return r177;
                                        else
                                            v7 = w[d];
                                        end;
                                    else
                                        v7 = r158;
                                    end;
                                end;
                            end; 
                        end)((function(arg1_111, arg2_111, ...)
                            local c = {
                                c[19],
                                c[2],
                                c[3],
                                c[4],
                                c[12],
                                185,
                                c[1]
                            };
                            v1 = arg1_111;
                            U = arg2_111;
                            v5 = w[c[1]](v1) == "buffer";
                            if v5 then
                                G = {
                                    w[c[4]](v1)
                                };
                            end;
                            v5 = v5;
                            v5 = v5;
                            v5 = (O or {
                                #v1
                            })[1];
                            v4 = v5;
                            v5 = w[c[6]];
                            if U then
                                v5 = v5;
                                return v5(v1, v5, U, v5);
                            else
                                w[c[7]](v5 == 32 and 240 or (v5 == 16 and 176 or v5 == 24 and 208));
                            end; 
                        end)(arg1_101), r158, r159); 
                    end,
                    ["\x00ECC"] = function(arg1_121, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_121;
                        local function r182(arg1_122, ...)
                            v1 = arg1_122;
                            for U = 0, 15 do
                                v1[U] = v1[U] + 65536;
                                v2 = v1[U] / 65536 - v1[U] / 65536 % 1;
                                if U < 15 then
                                    v1[U + 1] = v1[U + 1] + v2 - 1;
                                else
                                    v1[0] = v1[0] + 38 * (v2 - 1);
                                end;
                                v1[U] = v1[U] - v2 * 65536; 
                            end;
                            return; 
                        end;
                        local function r183(arg1_123, arg2_123, arg3_123, ...)
                            v1 = arg1_123;
                            O = arg3_123;
                            U = arg2_123;
                            for E = 0, 15 do
                                v1[E] = v1[E] * ((O - 1) % 2) + U[E] * O;
                                U[E] = U[E] * ((O - 1) % 2) + v1[E] * O; 
                            end;
                            return; 
                        end;
                        local function r184(arg1_124, arg2_124, ...)
                            v1 = arg1_124;
                            U = arg2_124;
                            for O = 0, 15 do
                                v1[O] = U[2 * O] + U[2 * O + 1] * 256; 
                            end;
                            v1[15] = v1[15] % 32768;
                            return; 
                        end;
                        local function r185(arg1_125, arg2_125, ...)
                            local c = {
                                20,
                                21
                            };
                            E = {};
                            v1 = arg1_125;
                            O = {};
                            for G = 0, 15 do
                                O[G] = arg2_125[G]; 
                            end;
                            w[c[1]](O);
                            w[c[1]](O);
                            w[c[1]](O);
                            G = {
                                [0] = 65517,
                                [15] = 32767
                            };
                            for r = 1, 14 do
                                G[v4] = 65535; 
                            end;
                            for r = 0, 1 do
                                i = O[0];
                                M = G[0];
                                E[0] = 0;
                                for Q = 0, 15, 15 do
                                    e = 0;
                                    v3 = ({})[e] - G[e];
                                    E[e] = v3 - (E[e - 1] / 65536 - E[e - 1] / 65536 % 1) % 2;
                                    E[e - 1] = (E[e - 1] + 65536) % 65536; 
                                end;
                                w[c[2]](O, E, 1 - (E[15] / 65536 - E[15] / 65536 % 1) % 2); 
                            end;
                            for r = 0, 15 do
                                v1[2 * v4] = O[v4] % 256;
                                v1[2 * v4 + 1] = O[v4] / 256 - O[v4] / 256 % 1; 
                            end;
                            return; 
                        end;
                        local function r186(arg1_126, arg2_126, arg3_126, ...)
                            for E = 0, 15 do
                                arg1_126[E] = arg2_126[E] + arg3_126[E]; 
                            end;
                            return; 
                        end;
                        local function r187(arg1_127, arg2_127, arg3_127, ...)
                            for E = 0, 15 do
                                arg1_127[E] = arg2_127[E] - arg3_127[E]; 
                            end;
                            return; 
                        end;
                        local function r188(arg1_128, arg2_128, arg3_128, ...)
                            local c = {
                                20
                            };
                            v1 = arg1_128;
                            U = arg2_128;
                            O = arg3_128;
                            E = {};
                            for G = 0, 31 do
                                E[G] = 0; 
                            end;
                            for G = 0, 15 do
                                for b = 0, 15 do
                                    E[G + b] = E[G + b] + arg2_128[G] * arg3_128[b]; 
                                end; 
                            end;
                            for G = 0, 14 do
                                E[G] = E[G] + 38 * E[G + 16]; 
                            end;
                            for G = 0, 15 do
                                v1[G] = E[G]; 
                            end;
                            w[c[1]](v1);
                            w[c[1]](v1);
                            return; 
                        end;
                        local function r189(arg1_129, arg2_129, ...)
                            O = {};
                            for E = 0, 15 do
                                O[E] = arg2_129[E]; 
                            end;
                            for E = 253, 0, -1 do
                                r188(O, O, O);
                                if E ~= 2 and E ~= 4 then
                                    w[v6](O, O, arg2_129);
                                end; 
                            end;
                            for E = 0, 15 do
                                arg1_129[E] = O[E]; 
                            end;
                            return; 
                        end;
                        local function r190(arg1_130, arg2_130, arg3_130, ...)
                            local c = {
                                19,
                                21,
                                22,
                                23,
                                26,
                                27,
                                24
                            };
                            v4 = {};
                            E = {};
                            U = arg2_130;
                            v2 = {};
                            d = {};
                            G = {};
                            v6 = {};
                            b = {};
                            i = {};
                            w[c[1]](v6, arg3_130);
                            for M = 0, 15 do
                                b[M] = 0;
                                i[M] = v6[M];
                                E[M] = 0;
                                G[M] = 0; 
                            end;
                            b[0] = 1;
                            G[0] = 1;
                            for M = 0, 30 do
                                d[M] = U[M]; 
                            end;
                            M = d[0];
                            v7 = d[0] % 8;
                            d[0] = 0;
                            d[31] = U[31] % 64 + 64;
                            v8 = -1;
                            for Q = 0, 0, 0 do
                                l = 0;
                                v3 = d[l / 8 - l / 8 % 1] / 2 ^ (l % 8) - d[l / 8 - l / 8 % 1] / 2 ^ (l % 8) % 1;
                                F = v3 % 2;
                                w[c[2]](b, i, F);
                                w[c[2]](E, G, F);
                                w[c[3]](v4, b, E);
                                w[c[4]](b, b, E);
                                w[c[3]](E, i, G);
                                w[c[4]](i, i, G);
                                w[c[5]](G, v4, v4);
                                w[c[5]](v2, b, b);
                                w[c[5]](b, E, b);
                                w[c[5]](E, i, v4);
                                w[c[3]](v4, b, E);
                                w[c[4]](b, b, E);
                                w[c[5]](i, b, b);
                                w[c[4]](E, G, v2);
                                w[c[5]](b, E, {
                                    [0] = 56129,
                                    1,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0
                                });
                                w[c[3]](b, b, G);
                                w[c[5]](E, E, b);
                                w[c[5]](b, G, v2);
                                w[c[5]](G, i, v6);
                                w[c[5]](i, v4, v4);
                                w[c[2]](b, i, F);
                                w[c[2]](E, G, F); 
                            end;
                            w[c[6]](E, E);
                            w[c[5]](b, b, E);
                            w[c[7]](arg1_130, b);
                            return; 
                        end;
                        return {
                            ["generate_keypair"] = function(arg1_131, ...)
                                v1 = arg1_131;
                                if v1 then
                                    v1 = v1;
                                    U = {};
                                    O = {};
                                    for G = 0, 31 do
                                        O[G] = v1(); 
                                    end;
                                    E = {
                                        [0] = 9
                                    };
                                    for r = 1, 31 do
                                        E[v4] = 0; 
                                    end;
                                    r190(U, O, E);
                                    return O, U;
                                else
                                    local function v3(...)
                                        local c = {
                                            c[1],
                                            c[2]
                                        };
                                        return math.random(0, 255); 
                                    end;
                                end; 
                            end,
                            ["get_shared_key"] = function(arg1_132, arg2_132, ...)
                                O = {};
                                r190(O, arg1_132, arg2_132);
                                return O; 
                            end
                        }; 
                    end,
                    ["\x00HASH"] = function(arg1_133, ...)
                        local c = {
                            c[25],
                            c[1],
                            c[2],
                            c[5]
                        };
                        v1 = arg1_133;
                        r191 = 4294967296;
                        r192 = r191 - 1;
                        local function r193(arg1_134, ...)
                            U = {};
                            r194 = arg1_134;
                            r195 = w[c[25]]({}, U);
                            U.__index = function(arg1_135, arg2_135, ...)
                                local c = {
                                    101,
                                    102
                                };
                                v1 = arg1_135;
                                U = arg2_135;
                                O = w[c[1]](U);
                                w[c[2]][U] = O;
                                return O; 
                            end;
                            return r195; 
                        end;
                        local function r196(arg1_136, arg2_136, ...)
                            r197 = arg1_136;
                            local function O(arg1_137, arg2_137, ...)
                                local c = {
                                    58,
                                    57
                                };
                                v1 = arg1_137;
                                O = 0;
                                U = arg2_137;
                                G = v1 ~= 0;
                                v3 = G;
                                while not G do
                                    if v3 then
                                        G = v1 % w[c[1]];
                                        v4 = U % w[c[1]];
                                        O = O + w[c[2]][G][v4] * 1;
                                        v1 = (v1 - G) / w[c[1]];
                                        U = (U - v4) / w[c[1]];
                                        E = 1 * w[c[1]];
                                    end;
                                    return v5 + (v1 + U) * 1; 
                                end;
                                v3 = U ~= 0; 
                            end;
                            r198 = arg2_136;
                            return O; 
                        end;
                        r199 = (function(arg1_138, ...)
                            local c = {
                                29,
                                30,
                                c[2],
                                c[3]
                            };
                            v1 = arg1_138;
                            r200 = w[c[1]](v1, 2);
                            v5 = w[c[1]];
                            v2 = v5;
                            return v5(w[c[2]](function(arg1_139, ...)
                                r201 = arg1_139;
                                return w[E](function(arg1_140, ...)
                                    local c = {
                                        U,
                                        151
                                    };
                                    return w[c[1]](w[c[2]], arg1_140); 
                                end); 
                            end), 2 ^ (v1.n or 1)); 
                        end)({
                            [0] = {
                                [0] = 0,
                                [1] = 1
                            },
                            [1] = {
                                [0] = 1,
                                [1] = 0
                            },
                            ["n"] = 4
                        });
                        local function r202(arg1_141, arg2_141, arg3_141, ...)
                            local c = {
                                31,
                                34,
                                39
                            };
                            E = {
                                f(4, S(C))
                            };
                            v1 = arg1_141;
                            if arg2_141 then
                                G = w[c[2]](arg1_141 % w[c[1]], arg2_141 % w[c[1]]);
                                if arg3_141 then
                                    w[v6](v2, arg3_141, ...);
                                end;
                                return G;
                            end;
                            if v1 then
                                return v1 % w[c[1]];
                            end;
                            return 0; 
                        end;
                        local function r203(arg1_142, arg2_142, arg3_142, ...)
                            local c = {
                                31,
                                34,
                                32
                            };
                            v1 = arg1_142;
                            U = arg2_142;
                            E = {
                                f(4, S(C))
                            };
                            if U then
                                v1 = arg1_142 % w[c[1]];
                                U = arg2_142 % w[c[1]];
                                G = (v1 + U - w[c[2]](v1, U)) / 2;
                                if arg3_142 then
                                    bit32_band(v4, arg3_142, ...);
                                end;
                                return G;
                            end;
                            if v1 then
                                return v1 % w[c[1]];
                            end;
                            return w[c[3]]; 
                        end;
                        local function r204(arg1_143, ...)
                            return (-1 - arg1_143) % r191; 
                        end;
                        local function r205(arg1_144, arg2_144, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            U = arg2_144;
                            v1 = arg1_144;
                            if U < 0 then
                                return lshift(v1, -U);
                            end;
                            return math.floor(v1 % 4294967296 / 2 ^ U); 
                        end;
                        local function r206(arg1_145, arg2_145, ...)
                            local c = {
                                36,
                                31
                            };
                            U = arg2_145;
                            if U > 31 or U < -31 then
                                return 0;
                            end;
                            return w[c[1]](arg1_145 % w[c[2]], U); 
                        end;
                        local function r207(arg1_146, arg2_146, ...)
                            U = arg2_146;
                            v1 = arg1_146;
                            if U < 0 then
                                return r206(v1, -U);
                            end;
                            return v1 * 2 ^ U % 4294967296; 
                        end;
                        local function r208(arg1_147, arg2_147, ...)
                            local c = {
                                31,
                                35,
                                37,
                                40
                            };
                            v1 = arg1_147 % w[c[1]];
                            U = arg2_147 % 32;
                            return w[c[3]](v1, U) + w[c[4]](w[c[2]](v1, 2 ^ U - 1), 32 - U); 
                        end;
                        r209 = {
                            1116352408,
                            1899447441,
                            3049323471,
                            3921009573,
                            961987163,
                            1508970993,
                            2453635748,
                            2870763221,
                            3624381080,
                            310598401,
                            607225278,
                            1426881987,
                            1925078388,
                            2162078206,
                            2614888103,
                            3248222580,
                            3835390401,
                            4022224774,
                            264347078,
                            604807628,
                            770255983,
                            1249150122,
                            1555081692,
                            1996064986,
                            2554220882,
                            2821834349,
                            2952996808,
                            3210313671,
                            3336571891,
                            3584528711,
                            113926993,
                            338241895,
                            666307205,
                            773529912,
                            1294757372,
                            1396182291,
                            1695183700,
                            1986661051,
                            2177026350,
                            2456956037,
                            2730485921,
                            2820302411,
                            3259730800,
                            3345764771,
                            3516065817,
                            3600352804,
                            4094571909,
                            275423344,
                            430227734,
                            506948616,
                            659060556,
                            883997877,
                            958139571,
                            1322822218,
                            1537002063,
                            1747873779,
                            1955562222,
                            2024104815,
                            2227730452,
                            2361852424,
                            2428436474,
                            2756734187,
                            3204031479,
                            3329325298
                        };
                        local function r210(arg1_148, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            return string.gsub(arg1_148, ".", function(arg1_149, ...)
                                local c = {
                                    c[1],
                                    c[2]
                                };
                                return string.format("%02x", string.byte(arg1_149)); 
                            end); 
                        end;
                        local function r211(arg1_150, arg2_150, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            v1 = arg1_150;
                            for G = 1, arg2_150 do
                                d = v1 % 256;
                                O = string.char(d) .. O;
                                v1 = (v1 - d) / 256; 
                            end;
                            return ""; 
                        end;
                        local function r212(arg1_151, arg2_151, ...)
                            local c = {
                                c[2],
                                c[3]
                            };
                            U = arg2_151;
                            O = 0;
                            v3 = 0;
                            for o = U, U + 3 do
                                O = O * 256 + string.byte(arg1_151, v2); 
                            end;
                            return O; 
                        end;
                        local function r213(arg1_152, arg2_152, ...)
                            local c = {
                                44,
                                c[2],
                                c[3],
                                c[4]
                            };
                            U = arg2_152;
                            U = w[c[1]](8 * U, 8);
                            v1 = arg1_152 .. "\x80" .. string.rep("\x00", 64 - (U + 9) % 64) .. U;
                            w[c[4]](#v1 % 64 == 0);
                            return v1; 
                        end;
                        local function r214(arg1_153, ...)
                            v1 = arg1_153;
                            v1[1] = 1779033703;
                            v1[2] = 3144134277;
                            v1[3] = 1013904242;
                            v1[4] = 2773480762;
                            v1[5] = 1359893119;
                            v1[6] = 2600822924;
                            v1[7] = 528734635;
                            v1[8] = 1541459225;
                            return v1; 
                        end;
                        local function r215(...)
                            v1[32] = 31[2 * 32] + 31[2 * 32 + 1] * 256; 
                        end;
                        return (function(arg1_154, ...)
                            local c = {
                                42,
                                47,
                                46,
                                43,
                                44
                            };
                            v1 = arg1_154;
                            v1 = w[c[1]](v1, #v1);
                            U = w[c[2]]({});
                            for E = 1, #v1, 64 do
                                w[c[3]](v1, E, U); 
                            end;
                            return w[c[4]](w[c[5]](U[1], 4) .. w[c[5]](U[2], 4) .. w[c[5]](U[3], 4) .. w[c[5]](U[4], 4) .. w[c[5]](U[5], 4) .. w[c[5]](U[6], 4) .. w[c[5]](U[7], 4) .. w[c[5]](U[8], 4)); 
                        end)(v1); 
                    end
                }; 
            end;
            r74.i = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                return {
                    ["\x00padString"] = function(arg1_155, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_155;
                        U = v1.sub(v1, 1, math.floor(#v1 / 16) * 16);
                        O = 16 - #U % 16;
                        if O == 16 then
                            O = 0;
                        end;
                        return U .. string.rep("0", O); 
                    end,
                    ["\x00strToHex"] = function(arg1_156, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_156;
                        return v1.gsub(v1, ".", function(arg1_157, ...)
                            local c = {
                                c[1],
                                c[2]
                            };
                            v1 = arg1_157;
                            return string.format("%02x", v1.byte(v1)); 
                        end); 
                    end,
                    ["\x00hexToBin"] = function(arg1_158, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_158;
                        return v1.gsub(v1, "..", function(arg1_159, ...)
                            local c = {
                                c[1],
                                c[2]
                            };
                            return string.char(tonumber(arg1_159, 16)); 
                        end); 
                    end,
                    ["\x00bytesToHex"] = function(arg1_160, ...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        v1 = arg1_160;
                        for O = 0, #v1 do
                            if v1[O] then
                                U = U .. string.format("%02x", arg1_160[O]);
                            end; 
                        end;
                        return ""; 
                    end,
                    ["\x00hexToBytes"] = function(arg1_161, ...)
                        U = {};
                        O = 0;
                        v1 = arg1_161;
                        for E = 1, #v1, 2 do
                            v5 = tonumber(v1.sub(v1, E, E + 1), 16);
                            U[O] = v5;
                            O = O + 1; 
                        end;
                        return U; 
                    end
                }; 
            end;
            r74.j = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                return {
                    ["\x00generateNonce"] = function(...)
                        local c = {
                            c[1],
                            c[2]
                        };
                        for U = 1, 16 do
                            v1 = v1 .. string.char(math.random(97, 122)); 
                        end;
                        return ""; 
                    end
                }; 
            end;
            r74.k = function(...)
                local c = {
                    28,
                    c[1],
                    c[2],
                    170,
                    136,
                    191
                };
                r216 = w[c[1]].load("a");
                r217 = w[c[4]](w[c[1]].load("b"));
                r218 = w[c[4]](w[c[1]].load("c"));
                r219 = w[c[1]].load("d");
                return function(arg1_162, arg2_162, ...)
                    local c = {
                        c[2],
                        c[3],
                        107,
                        108,
                        109,
                        c[5],
                        110,
                        c[6]
                    };
                    v1 = arg1_162;
                    O = getfenv(2);
                    E = O["KEY_INFO\x00"];
                    G = w[c[3]]["\x00sign"](w[c[3]]["\x00lcg"](w[c[3]]["\x00generateSeed"](), 1, 1000000, 9000000000)[1], v1);
                    v4 = w[c[4]].__index()["\x00HASH"](16 .. G);
                    v6 = w[c[4]].__index()["\x00HASH"](v4 .. w[c[4]].__index()["\x00HASH"](16 .. G * 2.14));
                    M = w[c[4]].__index()["\x00AES"](w[c[5]].__index()["\x00hexToBin"](v6));
                    v7 = w[c[4]].__index()["\x00AES"](w[c[5]].__index()["\x00hexToBin"](v6));
                    M = "https://api.authguard.org/wb/";
                    M = w[c[8]]({
                        ["Url"] = M.gsub(M, "\x00", "") .. w[c[5]].__index()["\x00strToHex"](w[c[6]](M.Encrypt(M, w[c[7]]().stringify({
                            ["webhookUrl"] = v1,
                            ["timestamp"] = os.time()
                        })))),
                        ["Method"] = "POST",
                        ["Headers"] = {
                            ["Content-Type"] = "application/json",
                            ["X"] = tostring(G)
                        },
                        ["Body"] = w[c[7]]().stringify({
                            ["payload"] = w[c[5]].__index()["\x00strToHex"](w[c[6]](v7.Encrypt(v7, w[c[7]]().stringify({
                                ["payload"] = arg2_162,
                                ["timestamp"] = os.time(),
                                ["key"] = O["\x00\x01"],
                                ["serviceId"] = O["\x00\x02"]
                            })))),
                            ["secret"] = v4
                        })
                    });
                    if M.StatusCode ~= 201 then
                        return nil, "Failed to send webhook: " .. tostring(M.StatusCode);
                    end;
                    v7 = w[c[7]]().parse(M.Body);
                    return; 
                end; 
            end;
            r74.l = function(...)
                local c = {
                    c[1],
                    c[2]
                };
                wrap = function(arg1_163, arg2_163, ...)
                    local c = {
                        c[1],
                        c[2]
                    };
                    v5 = "<SANITIZE:%s|%s>";
                    return v5.format(v5, arg2_163, tostring(arg1_163)); 
                end;
                return wrap; 
            end;
            dc = {};
            dc.__index = dc;
            dc.GetKeyLink = function(arg1_164, ...)
                local c = {
                    c[1],
                    c[2],
                    163,
                    164
                };
                U = arg1_164.Service;
                if U then
                    ___SERVICE__ = U;
                    return "https://authguard.org/a/" .. ___SERVICE__;
                else
                    (function(...)
                        w[vc](6);
                        v1 = {
                            f(1, S(C))
                        };
                        while true do end;
                        return; 
                    end)(___SERVICE__, w[c[4]]("table"));
                end; 
            end;
            dc.GetFlag = function(arg1_165, ...)
                local c = {
                    c[1],
                    c[2],
                    163,
                    164,
                    28,
                    170,
                    168,
                    125,
                    136,
                    191
                };
                v1 = arg1_165;
                U = v1.Service;
                if U then
                    v6 = "N\xaeKt";
                    ___SERVICE__ = U;
                    G = w[c[1]];
                    d = 23355663149691;
                    v4 = w[c[2]];
                    v2 = v4(v6, d);
                    E = G[v2];
                    O = v1[E];
                    if O then
                        __FLAG__ = O;
                        O = w[c[5]].load("a");
                        E = w[c[6]](w[c[5]].load("b"));
                        G = w[c[6]](w[c[5]].load("c"));
                        v4 = w[c[5]].load("d");
                        v2 = w[c[5]].load("e");
                        v6 = "flag:" .. ___SERVICE__ .. ":" .. __FLAG__;
                        d = v2.get(v6);
                        if d then
                            w[c[7]]("Using cached flag value!");
                            return d;
                        end;
                        i = O["\x00sign"](O["\x00lcg"](O["\x00generateSeed"](), 1, 1000000, 9000000000)[1], ___SERVICE__);
                        M = E.__index()["\x00HASH"](16 .. i);
                        m = "https://api.authguard.org/flags/payload\x00";
                        Zc = E.__index()["\x00AES"](G.__index()["\x00hexToBin"](E.__index()["\x00HASH"](M .. E.__index()["\x00HASH"](16 .. i * 2.14))));
                        u = v4().parse(w[c[10]]({
                            ["Method"] = "POST",
                            ["Url"] = m.gsub(m, "\x00", ""),
                            ["Body"] = v4().stringify({
                                ["payload"] = G.__index()["\x00strToHex"](w[c[9]](Zc.Encrypt(Zc, v4().stringify({
                                    ["serviceId"] = ___SERVICE__,
                                    ["flag"] = __FLAG__,
                                    ["timestamp"] = w[c[8]]()
                                })))),
                                ["secret"] = M
                            }),
                            ["Headers"] = {
                                ["content-type"] = "application/json",
                                ["X-Signature"] = E.__index()["\x00HASH"](w[c[8]]() .. M),
                                ["X"] = i
                            }
                        }).Body);
                        if not u.success then
                            w[c[7]]("Failed to retrieve flag!");
                            return nil;
                        end;
                        if math.abs(w[c[8]]() - u.exp) > 60 then
                            w[c[7]]("Flag expired!");
                            return nil;
                        end;
                        m = E.__index()["\x00AES"](G.__index()["\x00hexToBin"](E.__index()["\x00HASH"](tostring(u.exp * 3.14) .. ___SERVICE__ .. __FLAG__)));
                        H = v4().parse(w[c[9]](m.Decrypt(m, G.__index()["\x00hexToBin"](u.payload))));
                        if H.timestamp == u.exp then
                            w[c[7]]("Flag retrieved successfully!");
                            if type(H.value) ~= H.type then
                                w[c[7]]("Type mismatch in flag value!");
                                return nil;
                            end;
                            v2.add(v6, H.value, 60);
                            return H.value;
                        end;
                        w[c[7]]("Invalid flag response!");
                        return nil;
                    else
                        U = (function(...)
                            v1 = {
                                f(1, S(C))
                            };
                            w[vc](15);
                            while true do end;
                            return; 
                        end)(__FLAG__, w[c[4]]("table"));
                    end;
                else
                    (function(...)
                        w[vc](6);
                        v1 = {
                            f(1, S(C))
                        };
                        while true do end;
                        return; 
                    end)(___SERVICE__, w[c[4]]("table"));
                end; 
            end;
            dc.ValidateKey = function(arg1_166, ...)
                local c = {
                    164,
                    c[1],
                    c[2],
                    163,
                    167,
                    165,
                    114,
                    142,
                    116,
                    117,
                    169,
                    28,
                    170,
                    161,
                    125,
                    136,
                    191,
                    168,
                    131,
                    124,
                    126,
                    162
                };
                U = task;
                v5 = w[c[1]];
                v5("table");
                E = arg1_166;
                r220 = E.SecurityLevel or 1;
                E.Callback = function(...)
                    v1 = {
                        f(1, S(C))
                    };
                    w[vc](7);
                    while true do end;
                    return; 
                end;
                type(w[c[5]]);
                v2 = v5;
                v6 = E.Service;
                if v6 then
                    w[c[6]] = v6;
                    w[c[5]] = true;
                    M = w[c[2]];
                    v7 = w[c[3]];
                    v8 = v7("\xde\x19\xd9", 33072324934696);
                    i = M[v8];
                    b = E[i];
                    v6 = b and {
                        w[c[7]]({
                            ["Validated"] = w[c[1]]("table"),
                            ["APIKey"] = w[c[8]](1000000, 2000000)
                        }, {
                            ["__index"] = function(arg1_167, arg2_167, ...)
                                local c = {
                                    c[1],
                                    c[2],
                                    c[3],
                                    c[4],
                                    c[9]
                                };
                                v1 = arg1_167;
                                w[c[4]](12);
                                while true do end;
                                return w[c[5]](w[c[1]]("table"), arg2_167); 
                            end,
                            ["__newindex"] = function(arg1_168, arg2_168, ...)
                                local c = {
                                    c[1],
                                    c[2],
                                    c[3],
                                    c[4],
                                    c[10]
                                };
                                v1 = arg1_168;
                                w[c[4]](13);
                                while true do end;
                                return w[c[5]](w[c[1]]("table"), arg2_168); 
                            end,
                            ["__tostring"] = function(arg1_169, arg2_169, ...)
                                local c = {
                                    c[4],
                                    c[1],
                                    c[2],
                                    c[3]
                                };
                                v1 = arg1_169;
                                U = arg2_169;
                                w[c[1]](14);
                                while true do end;
                                return tostring(w[c[2]]("table")); 
                            end,
                            ["__call"] = w[c[11]](function(...)
                                local c = {
                                    c[12],
                                    c[2],
                                    c[3],
                                    c[13],
                                    c[11],
                                    c[6],
                                    c[14],
                                    c[15],
                                    c[16],
                                    c[17],
                                    c[18],
                                    52,
                                    c[4],
                                    c[19],
                                    100,
                                    c[20],
                                    c[21],
                                    c[22]
                                };
                                r221 = w[c[1]].load("f");
                                r222 = w[c[1]].load("g");
                                r223 = w[c[4]](w[c[1]].load("h"));
                                r224 = w[c[4]](w[c[1]].load("i"));
                                r225 = w[c[4]](w[c[1]].load("j")).__index()["\x00generateNonce"];
                                return w[c[5]](function(...)
                                    local c = {
                                        95,
                                        c[2],
                                        c[3],
                                        c[6],
                                        97,
                                        99,
                                        c[7],
                                        c[8],
                                        98,
                                        c[9],
                                        96,
                                        c[10],
                                        c[11],
                                        c[12],
                                        c[13],
                                        c[14],
                                        c[15],
                                        c[16],
                                        c[17],
                                        c[18]
                                    };
                                    {
                                        f(1, S(C))
                                    } = {
                                        f(1, S(C))
                                    };
                                    U = w[c[1]]["\x00sign"](w[c[1]]["\x00lcg"](w[c[1]]["\x00generateSeed"](), 1, 1000000, 9000000000)[1], w[c[4]]);
                                    v1 = w[c[5]].__index()["\x00HASH"](16 .. U);
                                    w[c[5]].__index()["\x00HASH"](16 .. U * 2.14);
                                    v6 = w[c[5]].__index()["\x00HASH"](v1 .. 52);
                                    v8 = w[c[5]].__index()["\x00AES"](w[c[9]].__index()["\x00hexToBin"](v6));
                                    v5 = {
                                        ["payload"] = w[c[9]].__index()["\x00strToHex"](w[c[10]](v8.Encrypt(v8, w[c[11]]().stringify({
                                            ["hwid"] = w[c[7]](),
                                            ["key"] = __LICENSE_KEY__,
                                            ["timestamp"] = w[c[8]](),
                                            ["serviceId"] = w[c[4]]
                                        })))),
                                        ["secret"] = v1
                                    };
                                    b = "https://api.authguard.org/validate/v2\x00";
                                    u = identifyexecutor;
                                    if u then
                                        identifyexecutor();
                                    end;
                                    v5 = v5;
                                    M = w[c[11]]().parse(w[c[12]]({
                                        ["Url"] = b.gsub(b, "\x00", ""),
                                        ["Method"] = "POST",
                                        ["Headers"] = {
                                            ["content-type"] = "application/json",
                                            ["X-Signature"] = signature,
                                            ["X-Nonce"] = w[c[6]](),
                                            ["X-Executor"] = u,
                                            ["X"] = tostring(U)
                                        },
                                        ["Body"] = w[c[11]]().stringify(v5)
                                    }).Body);
                                    if not M.success then
                                        w[c[13]]("Incorrect key!");
                                        if w[c[14]] == 1 then
                                            return "invalid";
                                        end;
                                        if w[c[14]] == 2 then
                                            v5 = game.Players.LocalPlayer;
                                            v5.Kick(v5, "Incorrect key!");
                                            return "invalid";
                                        end;
                                        if w[c[14]] == 3 then
                                            v5 = game.Players.LocalPlayer;
                                            v5.Kick(v5, "Incorrect key!");
                                            while true do end;
                                            return "invalid";
                                        end;
                                        return "invalid";
                                    end;
                                    if M.secret ~= 52 then
                                        w[c[15]](16);
                                        while true do end;
                                    end;
                                    33072324934696 = w[c[5]].__index()["\x00AES"](w[c[9]].__index()["\x00hexToBin"](v6));
                                    v7 = w[c[11]]().parse(w[c[10]](33072324934696.Decrypt(33072324934696, w[c[16]](w[c[9]].__index()["\x00hexToBin"](M.payload)))));
                                    if v7.status ~= "success" then
                                        w[c[15]](17);
                                        while true do end;
                                        v5("table") = nil;
                                        52 = nil;
                                        type(w[c[5]]) = nil;
                                        true = nil;
                                        return;
                                    end;
                                    w[c[17]].AG_ExpiredAt = v7.keyInfo.expiredAt;
                                    w[c[17]].AG_Hwid = v7.keyInfo.hwid;
                                    w[c[17]].AG_IsPremium = v7.keyInfo.isPremium;
                                    v5 = w[c[17]];
                                    "\xde\x19\xd9" = v5;
                                    v5 = v5;
                                    v5.AG_DiscordId = #v7.keyInfo.discordId > 0 and v7.keyInfo.discordId or nil;
                                    w[c[17]].AG_IsKeyless = v7.keyInfo.keyless;
                                    w[c[17]].AG_ExecutedCount = v7.keyInfo.executedCount;
                                    w[c[17]].AG_SecondsLeft = v7.keyInfo.expiredAt - w[c[8]]();
                                    w[c[17]].AG_UserNote = v7.keyInfo.note;
                                    w[c[17]].LRM_ScriptName = "None";
                                    w[c[17]].LRM_LinkedDiscordId = w[c[17]].AG_DiscordId;
                                    w[c[17]].LRM_TotalExecutions = w[c[17]].AG_ExecutedCount;
                                    w[c[17]].LRM_SecondsLeft = w[c[17]].AG_SecondsLeft;
                                    w[c[17]].LRM_UserNote = w[c[17]].AG_UserNote;
                                    w[c[17]].LRM_IsUserPremium = w[c[17]].AG_IsPremium;
                                    w[c[17]].LRM_ScriptVersion = "1.0.0";
                                    w[c[17]]["\x00\x01"] = v7.keyInfo.key;
                                    w[c[17]]["\x00\x02"] = v7.serviceId;
                                    w[c[13]](w[c[19]]("[AuthGuard] Validated in %f seconds", w[c[18]]() - w[c[20]]));
                                    return "validated"; 
                                end)(); 
                            end)
                        })()
                    };
                    v5 = v5;
                    __LICENSE_KEY__ = (function(...)
                        v1 = {
                            f(1, S(C))
                        };
                        w[vc](11);
                        while true do end;
                        return; 
                    end)(__LICENSE_KEY__, w[c[1]]("table"));
                    r226 = getfenv(2);
                    return w[c[7]]({
                        ["Validated"] = w[c[1]]("table"),
                        ["APIKey"] = w[c[8]](1000000, 2000000)
                    }, {
                        ["__index"] = function(arg1_170, arg2_170, ...)
                            local c = {
                                c[1],
                                c[2],
                                c[3],
                                c[4],
                                c[9]
                            };
                            v1 = arg1_170;
                            w[c[4]](12);
                            while true do end;
                            return w[c[5]](w[c[1]]("table"), arg2_170); 
                        end,
                        ["__newindex"] = function(arg1_171, arg2_171, ...)
                            local c = {
                                c[1],
                                c[2],
                                c[3],
                                c[4],
                                c[10]
                            };
                            v1 = arg1_171;
                            w[c[4]](13);
                            while true do end;
                            return w[c[5]](w[c[1]]("table"), arg2_171); 
                        end,
                        ["__tostring"] = function(arg1_172, arg2_172, ...)
                            local c = {
                                c[4],
                                c[1],
                                c[2],
                                c[3]
                            };
                            v1 = arg1_172;
                            U = arg2_172;
                            w[c[1]](14);
                            while true do end;
                            return tostring(w[c[2]]("table")); 
                        end,
                        ["__call"] = w[c[11]](function(...)
                            local c = {
                                c[12],
                                c[2],
                                c[3],
                                c[13],
                                c[11],
                                c[6],
                                c[14],
                                c[15],
                                c[16],
                                c[17],
                                c[18],
                                52,
                                c[4],
                                c[19],
                                100,
                                c[20],
                                c[21],
                                c[22]
                            };
                            v1 = {
                                f(1, S(C))
                            };
                            r221 = w[c[1]].load("f");
                            r222 = w[c[1]].load("g");
                            r223 = w[c[4]](w[c[1]].load("h"));
                            r224 = w[c[4]](w[c[1]].load("i"));
                            r225 = w[c[4]](w[c[1]].load("j")).__index()["\x00generateNonce"];
                            return w[c[5]](function(...)
                                local c = {
                                    95,
                                    c[2],
                                    c[3],
                                    c[6],
                                    97,
                                    99,
                                    c[7],
                                    c[8],
                                    98,
                                    c[9],
                                    96,
                                    c[10],
                                    c[11],
                                    c[12],
                                    c[13],
                                    c[14],
                                    c[15],
                                    c[16],
                                    c[17],
                                    c[18]
                                };
                                v1 = {
                                    f(1, S(C))
                                };
                                U = w[c[1]]["\x00sign"](w[c[1]]["\x00lcg"](w[c[1]]["\x00generateSeed"](), 1, 1000000, 9000000000)[1], w[c[4]]);
                                E = w[c[5]].__index()["\x00HASH"](16 .. U);
                                G = w[c[5]].__index()["\x00HASH"](16 .. U * 2.14);
                                v6 = w[c[5]].__index()["\x00HASH"](E .. G);
                                v8 = w[c[5]].__index()["\x00AES"](w[c[9]].__index()["\x00hexToBin"](v6));
                                v5 = {
                                    ["payload"] = w[c[9]].__index()["\x00strToHex"](w[c[10]](v8.Encrypt(v8, w[c[11]]().stringify({
                                        ["hwid"] = w[c[7]](),
                                        ["key"] = __LICENSE_KEY__,
                                        ["timestamp"] = w[c[8]](),
                                        ["serviceId"] = w[c[4]]
                                    })))),
                                    ["secret"] = E
                                };
                                d = v5;
                                b = "https://api.authguard.org/validate/v2\x00";
                                p = identifyexecutor;
                                n = p;
                                if p then
                                    n = identifyexecutor();
                                end;
                                v5 = v5;
                                M = w[c[11]]().parse(w[c[12]]({
                                    ["Url"] = b.gsub(b, "\x00", ""),
                                    ["Method"] = "POST",
                                    ["Headers"] = {
                                        ["content-type"] = "application/json",
                                        ["X-Signature"] = signature,
                                        ["X-Nonce"] = w[c[6]](),
                                        ["X-Executor"] = n,
                                        ["X"] = tostring(U)
                                    },
                                    ["Body"] = w[c[11]]().stringify(d)
                                }).Body);
                                if not M.success then
                                    w[c[13]]("Incorrect key!");
                                    if w[c[14]] == 1 then
                                        return "invalid";
                                    end;
                                    if w[c[14]] == 2 then
                                        v5 = game.Players.LocalPlayer;
                                        v5.Kick(v5, "Incorrect key!");
                                        return "invalid";
                                    end;
                                    if w[c[14]] == 3 then
                                        v5 = game.Players.LocalPlayer;
                                        v5.Kick(v5, "Incorrect key!");
                                        while true do end;
                                        return "invalid";
                                    end;
                                    return "invalid";
                                end;
                                if M.secret ~= G then
                                    w[c[15]](16);
                                    while true do end;
                                end;
                                l = w[c[5]].__index()["\x00AES"](w[c[9]].__index()["\x00hexToBin"](v6));
                                v7 = w[c[11]]().parse(w[c[10]](l.Decrypt(l, w[c[16]](w[c[9]].__index()["\x00hexToBin"](M.payload)))));
                                if v7.status ~= "success" then
                                    w[c[15]](17);
                                    while true do end;
                                    return;
                                end;
                                w[c[17]].AG_ExpiredAt = v7.keyInfo.expiredAt;
                                w[c[17]].AG_Hwid = v7.keyInfo.hwid;
                                w[c[17]].AG_IsPremium = v7.keyInfo.isPremium;
                                v5 = w[c[17]];
                                e = v5;
                                v5 = v5;
                                v5.AG_DiscordId = #v7.keyInfo.discordId > 0 and v7.keyInfo.discordId or nil;
                                w[c[17]].AG_IsKeyless = v7.keyInfo.keyless;
                                w[c[17]].AG_ExecutedCount = v7.keyInfo.executedCount;
                                w[c[17]].AG_SecondsLeft = v7.keyInfo.expiredAt - w[c[8]]();
                                w[c[17]].AG_UserNote = v7.keyInfo.note;
                                w[c[17]].LRM_ScriptName = "None";
                                w[c[17]].LRM_LinkedDiscordId = w[c[17]].AG_DiscordId;
                                w[c[17]].LRM_TotalExecutions = w[c[17]].AG_ExecutedCount;
                                w[c[17]].LRM_SecondsLeft = w[c[17]].AG_SecondsLeft;
                                w[c[17]].LRM_UserNote = w[c[17]].AG_UserNote;
                                w[c[17]].LRM_IsUserPremium = w[c[17]].AG_IsPremium;
                                w[c[17]].LRM_ScriptVersion = "1.0.0";
                                w[c[17]]["\x00\x01"] = v7.keyInfo.key;
                                w[c[17]]["\x00\x02"] = v7.serviceId;
                                w[c[13]](w[c[19]]("[AuthGuard] Validated in %f seconds", w[c[18]]() - w[c[20]]));
                                return "validated"; 
                            end)(); 
                        end)
                    })();
                else
                    (function(...)
                        w[vc](9);
                        v1 = {
                            f(1, S(C))
                        };
                        while true do end;
                        return; 
                    end)(w[c[6]], w[c[1]]("table"));
                end; 
            end;
            r74.load("k");
            r74.load("l");
            uc = "1593";
            lc = "47bdc40f30ca44dba06dbbdbf1c58832";
            nc = game;
            mc = loadstring(nc.HttpGet(nc, "https://raw.githubusercontent.com/m1kp0/ftap/refs/heads/main/m1kp/ver.txt"))();
            if not isfolder("m1kp") then
                makefolder("m1kp");
            end;
            if not isfolder("m1kp/config") then
                makefolder("m1kp/config");
            end;
            if not isfolder("m1kp/autoload") then
                makefolder("m1kp/autoload");
            end;
            if not isfolder("m1kp/cache") then
                makefolder("m1kp/cache");
            end;
            if not isfolder("m1kp/figures") then
                makefolder("m1kp/figures");
            end;
            if not isfolder("m1kp/themes") then
                makefolder("m1kp/themes");
            end;
            if not isfolder("m1kp/version") then
                makefolder("m1kp/version");
            end;
            if not isfile("m1kp/version/version.txt") then
                writefile("m1kp/version/version.txt", "");
            end;
            Xc = isfile("m1kp/version/version.txt");
            if Xc then
                Hc = readfile("m1kp/version/version.txt");
            end;
            v5 = v5;
            if Xc then
                pc = Xc ~= mc;
            end;
            v5 = v5;
            if Xc then
                r24("New script version: " .. mc);
                r24("updating");
                writefile("m1kp/version/version.txt", mc);
                r24("Updated version");
                cf = game;
                writefile("m1kp/cache/orion_lib.lua", cf.HttpGet(cf, "https://raw.githubusercontent.com/m1kp0/BetterOrion/refs/heads/main/Library.lua"));
                r24("Updated Orion library");
                cf = game;
                writefile("m1kp/cache/lime_ui_lib.lua", cf.HttpGet(cf, "https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_lime.lua"));
                r24("Updated Lime library");
                cf = game;
                writefile("m1kp/cache/simple_tp_to_houses_script.lua", cf.HttpGet(cf, "https://raw.githubusercontent.com/m1kp0/ftap/refs/heads/main/simple_teleport_to_all_houses.lua"));
                r24("Updated house teleporter script");
                cf = game;
                writefile("m1kp/cache/m1kp.lua", cf.HttpGet(cf, "https://raw.githubusercontent.com/m1kp0/ftap/refs/heads/main/m1kp/module.lua"));
                r24("Updated m1kp");
            end;
            r24("Starting m1kp");
            loadstring(readfile("m1kp/cache/m1kp.lua"))();
            return; 
        end)(S(C));
    end;
end;
return (function(...)
    while true do
        l1 = l2;
        l2 = l1;
        r3(); 
    end;
    return; 
end)();
