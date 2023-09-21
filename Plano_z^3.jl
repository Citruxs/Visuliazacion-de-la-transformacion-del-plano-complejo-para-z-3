using Plots
using LinearAlgebra
X = LinRange(0,5,1000)
x0 = 1
U(x,x0) =  (x0^3-3*x0*x^2) #Determinamos las funciones U y V
V(x,x0) = 3*x0^2*(sqrt((x0^3-U(x,x0))/(3*x0))) - sqrt((x0^3-U(x,x0))/(3*x0))^3
pl = plot([reverse(U.(X,x0));U.(X,x0)],[reverse(V.(X,x0));V.(X,x0).*-1], legend = false, color = "blue") #Graficamos nuestras curvas uniendo los puntos para obtener un solo vector
x_0 = LinRange(-5,5,10) #Creamos un Rango entre -5 y 5 para graficar
for i in 1:length(x_0) #Para cada i entre 0 y la longitud del rango gráficara cada curva
    x0 = x_0[i]
    plot!([reverse(U.(X,x0));U.(X,x0)],[reverse(V.(X,x0));V.(X,x0).*-1],legend = false, color = "blue") #Agregamos cada curva
end

U(x,x0) =  sqrt((V(x,x0)+x0^3)/(3*x0))^3 - 3x0^2 * sqrt((V(x,x0)+x0^3)/(3*x0))
V(x,x0) = 3x^2*x0 - x0^3
x_0 = LinRange(-5,5,10)
for i in 1:length(x_0)
    x0 = x_0[i]
    plot!([reverse(U.(X,x0));U.(X,x0).*-1],[reverse(V.(X,x0));V.(X,x0)],legend = false, color = "orange")
end

pl
#savefig("z3.png") #Para guardar la imagen