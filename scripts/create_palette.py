# See: https://graphicdesign.stackexchange.com/questions/3682/where-can-i-find-a-large-palette-set-of-contrasting-colors-for-coloring-many-d

#values_triplet=[(2,63,165),(125,135,185),(190,193,212),(214,188,192),(187,119,132),(142,6,59),(74,111,227),(133,149,225),(181,187,227),(230,175,185),(224,123,145),(211,63,106),(17,198,56),(141,213,147),(198,222,199),(234,211,198),(240,185,141),(239,151,8),(15,207,192),(156,222,214),(213,234,231),(243,225,235),(246,196,225),(247,156,212)]
values_triplet=[(243,225,235),(246,196,225),(247,156,212)]
values_hex = []
for r,g,b in values_triplet:
    values_hex.append(f'#{r:02x}{g:02x}{b:02x}')


#print(values_hex)

# Print colored text
def colored(r, g, b, text):
    return f"\033[38;2;{r};{g};{b}m{text}\033[0m"

for i, (r,g,b) in enumerate(values_triplet):
    print(colored(r,g,b, f"Index {i}"))
