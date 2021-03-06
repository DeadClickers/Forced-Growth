
execute unless score @s fg.zef_math matches ..2 run scoreboard players add @s fg.zef_math 1

# Block detection
execute if block ~-1 ~-1 ~ air unless block ~1 ~-1 ~ air if block ~ ~1 ~ air run tag @s add block+x
execute if block ~1 ~-1 ~ air unless block ~-1 ~-1 ~ air if block ~ ~1 ~ air run tag @s add block-x
execute if block ~ ~-1 ~-1 air unless block ~ ~-1 ~1 air if block ~ ~1 ~ air run tag @s add block+z
execute if block ~ ~-1 ~1 air unless block ~ ~-1 ~-1 air if block ~ ~1 ~ air run tag @s add block-z


# Calculate updates
execute if entity @s[tag=block-z,tag=block+z,scores={fg.zef_math=..1}] run scoreboard players set @s fg.zef_math 2
execute if entity @s[tag=block-x,tag=block+x,scores={fg.zef_math=..1}] run scoreboard players set @s fg.zef_math 2

# Update
execute if score @s[tag=block-z,tag=block+z] fg.zef_math matches 2 run scoreboard players add @s fg.zef_update 1
execute if score @s[tag=block-x,tag=block+x] fg.zef_math matches 2 run scoreboard players add @s fg.zef_update 1

# Grow
execute if score @s fg.zef_update matches 1 if block ~ ~1 ~ air run setblock ~ ~ ~ chorus_plant
execute if score @s fg.zef_update matches 1 if block ~ ~1 ~ air run setblock ~ ~1 ~ chorus_flower



# Reset block detection
execute if score @s fg.zef_math matches 2 unless block ~-1 ~-1 ~ air run tag @s remove block+x
execute if score @s fg.zef_math matches 2 unless block ~1 ~-1 ~ air run tag @s remove block-x
execute if score @s fg.zef_math matches 2 unless block ~ ~-1 ~-1 air run tag @s remove block+z
execute if score @s fg.zef_math matches 2 unless block ~ ~-1 ~1 air run tag @s remove block-z

# Reset Calculation
scoreboard players set @s[scores={fg.zef_math=2}] fg.zef_math 0

scoreboard players reset @s[scores={fg.zef_update=16..}] fg.zef_update


