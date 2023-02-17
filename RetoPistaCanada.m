close all;
clc;
clearvars;

data=[];
angulo=6;
coF=1.1;
gr=9.8;

py=[568.631,400.148,505.450,358.027];
px=[821.356,737.114,589.691,526.510];

vf=polyfit(px,py,3);

c3=vf(1,1);
c2=vf(1,2);
c1=vf(1,3);
c0=vf(1,4);

c12=c3*3;
c11=c2*2;
c10=c1;

c21=c12*2;
c20=c11;

der1=@(x) c12*x.^2+c11*x+c10;
der2=@(x) c21*x+c20;

figure(1)
axis([520 830 200 650])
%grada1
xgr1 = [760 806.6 814.62 768.23];
ygr1 = [383 448.6 442.53 377.26];
patch(xgr1,ygr1,'b')
%grada2
xgr2 = [585 665 665 585];
ygr2 = [559.57 559.57 549.57 549.57];
patch(xgr2,ygr2,'b')
hold on;

funcion=@(x) c3*x.^3+c2*x.^2+c1*x+c0;
x=821.356:-1:525.510;
plot(x,funcion(x),'Color','black','LineWidth',15);
plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
hold on;

Textox = 550; Textoy = 370;
text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
texto1 = text(Textox, Textoy-60, ['X = ' num2str(px(1)) ' m']);
texto2 = text(Textox, Textoy-90, ['Y = ' num2str(py(1)) ' m']);
texto3 = text(Textox, Textoy-120, ['Velocidad Max sin Peralte= ' '0' ' km/h']);
texto4 = text(Textox, Textoy-150, ['Velocidad Max con Peralte= ' '0' ' km/h']);
texto6 = text(770, 365, 'Primer Grada','FontSize',8);
texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
hold on;

for e=x
    radio=((1+(der1(e))^2)^(3/2))/(abs(der2(e)));
    vmsams=(sqrt(radio*coF*gr));
    vmsakmh=(vmsams*3.6);
    if vmsakmh>=360
        vmsakmh=360;
    end
    vmcams=(sqrt((radio*gr)*(-(sin(deg2rad(angulo))-coF*cos(deg2rad(angulo))) ...
        /(cos(deg2rad(angulo))-coF*sin(deg2rad(angulo))))));
    vmcakmh=(vmcams*3.6);
    if vmcakmh>=360
        vmsakmh=360;
    end
    text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
    text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
    texto1 = text(Textox, Textoy-60, ['X = ' num2str(e) ' m']);
    texto2 = text(Textox, Textoy-90, ['Y = ' num2str(funcion(e)) ' m']);
    texto3 = text(Textox, Textoy-120, ['Velocidad Max sin Peralte= ' num2str(vmsakmh) ' km/h']);
    texto4 = text(Textox, Textoy-150, ['Velocidad Max con Peralte= ' num2str(vmcakmh) ' km/h']);
    texto5 = text(680,620,'Recorrido normal','FontSize',16,'HorizontalAlignment','center', ...
        'FontWeight','bold','Color','black');
    texto6 = text(770, 365, 'Primer Grada','FontSize',8);
    texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
    hold on;
    plot(x,funcion(x),'Color','black','LineWidth',15);
    plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
    patch(xgr1,ygr1,'b');
    patch(xgr2,ygr2,'b');
    hold on;
    animate = plot(e,funcion(e),'-r.','LineWidth',10);
    animate.MarkerSize = 30;
    axis([520 830 200 650])
    pause(0.01)
    if e ~= px(4)
        clf
    end
end

for e=x
    radio=((1+(der1(e))^2)^(3/2))/(abs(der2(e)));
    vmsams=(sqrt(radio*coF*gr));
    vmsakmh=(vmsams*3.6);
    if vmsakmh>=360
        vmsakmh=360;
    end
    vmcams=(sqrt((radio*gr)*(-(sin(deg2rad(angulo))-coF*cos(deg2rad(angulo)))/(cos(deg2rad(angulo))-coF*sin(deg2rad(angulo))))));
    vmcakmh=(vmcams*3.6);
    if vmcakmh>=360
        vmsakmh=360;
    end
    text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
    text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
    texto1 = text(Textox, Textoy-60, ['X = ' num2str(e) ' m']);
    texto2 = text(Textox, Textoy-90, ['Y = ' num2str(funcion(e)) ' m']);
    texto3 = text(Textox, Textoy-120, ['Velocidad Max sin Peralte= ' num2str(vmsakmh) ' km/h']);
    texto4 = text(Textox, Textoy-150, ['Velocidad Max con Peralte= ' num2str(vmcakmh) ' km/h']);
    texto5 = text(680,620,'Recorrido con derrape en la primera curva','FontSize',16,'HorizontalAlignment','center','FontWeight','bold','Color','black');
    texto6 = text(770, 365, 'Primer Grada','FontSize',8);
    texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
    hold on;
    plot(x,funcion(x),'Color','black','LineWidth',15);
    plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
    patch(xgr1,ygr1,'b');
    patch(xgr2,ygr2,'b');
    hold on;
    animate = plot(e,funcion(e),'-r.','LineWidth',10);
    animate.MarkerSize = 30;
    axis([520 830 200 650])
    pause(0.01)
    if e ~= px(4)
        clf
    end
    if radio <100
       tang = @(g) (der1(e)*(g-e))+funcion(e);
       x1=e:-1:700 ;
       for j=x1
           text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
           text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
           texto1 = text(Textox, Textoy-60, ['X = ' num2str(j) ' m']);
           texto2 = text(Textox, Textoy-90, ['Y = ' num2str(tang(j)) ' m']);
           texto5 = text(680,620,'Recorrido con derrape en la primera curva', ...
               'FontSize',16,'HorizontalAlignment','center','FontWeight','bold', ...
               'Color','black');
           texto6 = text(770, 365, 'Primer Grada','FontSize',8);
           texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
           hold on;
           plot(x,funcion(x),'Color','black','LineWidth',15);
           hold on;
           plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
           hold on;
           patch(xgr1,ygr1,'b');
           patch(xgr2,ygr2,'b');
           hold on;
           animate = plot(j,tang(j),'-r.','LineWidth',10);
           animate.MarkerSize = 30;
           axis([520 830 200 650])
           pause(0.01)
           if j ~= px(4)
               clf
           end
       end
       break
    end
end

for e=x
    radio=((1+(der1(e))^2)^(3/2))/(abs(der2(e)));
    vmsams=(sqrt(radio*coF*gr));
    vmsakmh=(vmsams*3.6);
    if vmsakmh>=360
        vmsakmh=360;
    end
    vmcams=(sqrt((radio*gr)*(-(sin(deg2rad(angulo))-coF*cos(deg2rad(angulo)))/(cos(deg2rad(angulo))-coF*sin(deg2rad(angulo))))));
    vmcakmh=(vmcams*3.6);
    if vmcakmh>=360
        vmsakmh=360;
    end
    text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
    text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
    texto1 = text(Textox, Textoy-60, ['X = ' num2str(e) ' m']);
    texto2 = text(Textox, Textoy-90, ['Y = ' num2str(funcion(e)) ' m']);
    texto3 = text(Textox, Textoy-120, ['Velocidad Max sin Peralte= ' num2str(vmsakmh) ' km/h']);
    texto4 = text(Textox, Textoy-150, ['Velocidad Max con Peralte= ' num2str(vmcakmh) ' km/h']);
    texto5 = text(680,620,'Recorrido con derrape en la segunda curva', ...
               'FontSize',16,'HorizontalAlignment','center','FontWeight','bold', ...
               'Color','black');
    texto6 = text(770, 365, 'Primer Grada','FontSize',8);
    texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
    hold on;
    plot(x,funcion(x),'Color','black','LineWidth',15);
    plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
    patch(xgr1,ygr1,'b');
    patch(xgr2,ygr2,'b');
    hold on;
    animate = plot(e,funcion(e),'-r.','LineWidth',10);
    animate.MarkerSize = 30;
    axis([520 830 200 650])
    pause(0.01)
    if e ~= px(4)
        clf
    end
    if radio <100 && e<670
       tang = @(g) (der1(e)*(g-e))+funcion(e);
       x1=e:-1:550 ;
       for j=x1
           text(Textox, Textoy, ['Punto inicial = ' num2str(px(1)) ', ' num2str(py(1))])
           text(Textox, Textoy-30, ['Punto final = ' num2str(px(1)) ', ' num2str(py(4))])
           texto1 = text(Textox, Textoy-60, ['X = ' num2str(j) ' m']);
           texto2 = text(Textox, Textoy-90, ['Y = ' num2str(tang(j)) ' m']);
           texto5 = text(680,620,'Recorrido con derrape en la segunda curva', ...
               'FontSize',16,'HorizontalAlignment','center','FontWeight','bold', ...
               'Color','black');
           texto6 = text(770, 365, 'Primer Grada','FontSize',8);
           texto7 = text(600, 575, 'Segunda Grada','FontSize',8);
           hold on;
           plot(x,funcion(x),'Color','black','LineWidth',15);
           hold on;
           plot(x,funcion(x),"Color","y","LineStyle","--",LineWidth=2);
           hold on;
           patch(xgr1,ygr1,'b');
           patch(xgr2,ygr2,'b');
           hold on;
           animate = plot(j,tang(j),'-r.','LineWidth',10);
           animate.MarkerSize = 30;
           axis([520 830 200 650])
           pause(0.01)
           if j ~= px(4)
               clf
           end
       end
       break
    end
end

t=1;
for i=px(1):-1:px(4)-1
        radio=(((1+(der1(i))^2)^(3/2))/(abs(der2(i))));
        vmsams=(sqrt(radio*coF*gr));
        vmsakmh=(vmsams*3.6);
        vmcams=(sqrt((radio*gr)*(-(sin(deg2rad(angulo))-coF*cos(deg2rad(angulo))) ...
            /(cos(deg2rad(angulo))-coF*sin(deg2rad(angulo))))));
        vmcakmh=(vmcams*3.6);
        data(t,1)=i;
        data(t,2)=funcion(i);
        data(t,3)=radio;
        data(t,4)=vmsams;
        data(t,5)=vmsakmh;
        data(t,6)=vmcams;
        data(t,7)=vmcakmh;
        t=t+1;
end
disp('----------- Tabla de resultados -----------')
disp(array2table(data,"VariableNames",{'X en m','Y en m','Radio de curvatura en m', ...
    'Velocidad máxima sin ángulo en peralte en m/s', ...
    'Velocidad máxima sin ángulo en peralte en km/h', ...
    'Velocidad máxima con ángulo en peralte en m/s', ...
    'Velocidad máxima con ángulo en peralte en km/h'}))
close all;

disp('Comprobar si pasa por el punto inicial y final')
disp('Puntos dados')
fprintf('Punto inicial: (%.3f,%.3f)\n',px(1),py(1))
fprintf('Punto inicial: (%.3f,%.3f)\n',px(4),py(4))
disp('Función evaluada en dichos puntos de x')
com1=funcion(px(1));
com2=funcion(px(4));
fprintf('En %.3f da como resultado un valor de %.3f para y\n',px(1),com1)
fprintf('En %.3f da como resultado un valor de %.3f para y\n',px(4),com2)
disp('Esto significa que la función modelada pasa por los puntos de inicio y fin en la pista')