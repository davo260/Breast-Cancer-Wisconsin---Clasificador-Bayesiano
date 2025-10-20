clc; clear; close all;

% 1) Leer wdbc.data (del mismo directorio que este script)
fname = 'wdbc.data';
if ~isfile(fname)
    error('No se encuentra "%s". Coloca el archivo en el mismo folder que este script.', fname);
end

opts = detectImportOptions(fname, 'FileType', 'text', 'Delimiter', ',');
opts.Delimiter = ',';
opts.VariableNamesLine = 0;   % el .data no trae encabezados

T = readtable('wdbc.data', 'FileType', 'text', 'Delimiter', ',');

% 2) Asignar nombres de columna
T.Properties.VariableNames = { ...
    'ID','Diagnosis', ...
    'radius_mean','texture_mean','perimeter_mean','area_mean', ...
    'smoothness_mean','compactness_mean','concavity_mean','concave_points_mean', ...
    'symmetry_mean','fractal_dimension_mean', ...
    'radius_se','texture_se','perimeter_se','area_se','smoothness_se', ...
    'compactness_se','concavity_se','concave_points_se','symmetry_se','fractal_dimension_se', ...
    'radius_worst','texture_worst','perimeter_worst','area_worst','smoothness_worst', ...
    'compactness_worst','concavity_worst','concave_points_worst','symmetry_worst','fractal_dimension_worst'};

% 3) Diagnosis a binario: M=1 (maligno), B=0 (benigno)
if iscellstr(T.Diagnosis) || isstring(T.Diagnosis) || iscategorical(T.Diagnosis)
    T.Diagnosis = double(strcmp(string(T.Diagnosis), 'M'));
end

% 4) Variables de interés y una versión con offset para concavity (evita log(0))
x_radius    = T.radius_mean;       %#ok<NASGU>
x_texture   = T.texture_mean;      %#ok<NASGU>
x_concavity = T.concavity_mean;    %#ok<NASGU>

% Sugerencia: para lognormal/gamma en concavity, usa una copia con offset pequeño:
x_concavity_pos = T.concavity_mean + 1e-6;  %#ok<NASGU>

disp('✅ Datos cargados y variables creadas en el Workspace:');
disp('   x_radius, x_texture, x_concavity, x_concavity_pos');
disp('   (usa x_concavity_pos para ajustar Lognormal/Gamma si hay ceros)');

% 5) Abrir dfittool
%    En la app: Data -> New data... -> elige x_radius / x_texture / x_concavity_pos
%    Luego Fit -> New fit... -> selecciona Normal / Lognormal / Gamma, y Apply.
dfittool;