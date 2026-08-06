print ("Olá, mundo!")

io.flush()
io.write("Digite um número: ")
io.flush()
local numero = tonumber(io.read())

if numero == nil then
    print("Entrada inválida! Digite um número.")
else
    print("Tabuada do " .. numero .. ":")
    for i = 1, 10 do
        print(numero .. " x " .. i .. " = " .. (numero * i))
    end
end