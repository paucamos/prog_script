import matplotlib.pyplot as plt

fig = plt.figure()
fig, ax = plt.subplots(1, 1, tight_layout=True)
years = [1, 2, 3, 4]
students = [42, 20, 9, 13]
ax.set_title("Distribució alumnes amb problemes de salud mental per anys")
ax.set_xlabel("Any carrera")
ax.set_ylabel("Num. Alumnes")
plt.bar(years, students)
plt.savefig("plot.jpg")
