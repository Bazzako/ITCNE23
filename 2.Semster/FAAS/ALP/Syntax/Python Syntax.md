## Generator
[variable ausgabe variable in liste if bedingung]

z.B:

"Normal"
```Python
Input = "Function As A Service"
only_upper = [char for char in range(len(Input)) if Input[char].isupper()]
print(only_upper)
```

"Generator"
```Python
[index for index,Upper in enumerate("Funciton As A Service") if Upper.isupper() ]
```


Test 2