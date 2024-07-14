import os
# make sure value of starting in sp file is 0.
st = "Vina0 a0 0 0\nVina1 a1 0 0\nVina2 a2 0 0\nVina3 a3 0 0\nVinb0 b0 0 0\nVinb1 b1 0 0\nVinb2 b2 0 0\nVinb3 b3 0 0"

for i in range(255):

    number = format(i, '08b')
    # print(number)
    num = list(number)
    print(num)
    rt = f"Vina0 a0 0 {num[0]}\nVina1 a1 0 {num[1]}\nVina2 a2 0 {num[2]}\nVina3 a3 0 {num[3]}\nVinb0 b0 0 {num[4]}\nVinb1 b1 0 {num[5]}\nVinb2 b2 0 {num[6]}\nVinb3 b3 0 {num[7]}"  #go to sp file and reset value to 0

    with open("project.sp","r") as fp:
        data = fp.read()
        data = data.replace(st,rt)

    with open("project.sp", "w") as fp:
        fp.write(data)

    st = rt
    os.system("ngspice_con project.sp")
    



