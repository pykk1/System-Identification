clear
clc
load proj_fit_07.mat

a = id.X{1}';
b = id.X{2}';
reshape(id.Y,1,[]);
transpose(id.Y);
id.Y.';
id.Y(:);
A = reshape(id.Y.',1,[]);

reshape(val.Y,1,[]);
transpose(val.Y);
val.Y.';
val.Y(:);
B = reshape(val.Y.',1,[]);
grad = 4;

for i = 1:grad
    fprintf('Grad = %d\n',i)
    indx=1;
    indx2=1;
    clear PHIVal
    clear PHIId
    for k = 1:131
        for q = 1:131
            PHIVal(indx2, :) = linieMatrice(i, k, q, val.X{1}, val.X{2});
            indx2 = indx2 + 1;
            if k <= 91 && q <= 91
                PHIId(indx, :) = linieMatrice(i, k, q, id.X{1}, id.X{2});
                indx = indx + 1;
            end
        end
    end
    THETA = pinv(PHIId) * A';
    yaprox = PHIVal * THETA;
    mse(i) = sum ((yaprox - B').^2) / length(B);
    yaproxId = PHIVal * THETA;
    mseId(i) = sum ((yaproxId - B').^2) / length(B);
    
    yaprox = reshape(yaprox,131,131);
    
        if i >= 14
            figure
            xlabel('X{1}');
            ylabel('X{2}');
            zlabel('Y');
            mesh(val.X{1}, val.X{2}, yaprox)
        end
end
fprintf('Final\n');

figure;
plot(mseId);
hold on;
plot(mse)
legend('MSE Identificare','MSE Validare');
xlabel('index');
ylabel('MSE');
