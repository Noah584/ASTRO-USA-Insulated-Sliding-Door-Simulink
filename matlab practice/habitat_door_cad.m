function habitat_door_cad()
    % -cool habitat door model soon to be actually CADed not simulink
    %-made to be able to export as stl and import through free cad as step into any
    %cad software but idk if that part works
    %-should still run fine

    clear; clc; close all;

    fig = figure('Name', 'Mars Analog Habitat - Insulation CAD Assembly', ...
        'NumberTitle', 'off', 'Color', [0.15 0.15 0.15]);
    ax = axes('Parent', fig);
    hold(ax, 'on'); grid(ax, 'on'); axis(ax, 'equal');
    view(ax, 3); rotate3d(fig, 'on');

    TotalWidth = 72;
    TotalHeight = 80;
    FrameDepth = 4.5;
    VinylThick = 2.0;

    PanelW = (TotalWidth - VinylThick*3) / 2;
    PanelH = TotalHeight - VinylThick*2;
    PanelThick = 1.75;

    TrackGap = 0.5;
    FixedZOffset = -(PanelThick/2 + TrackGap/2);
    SlidingZOffset = (PanelThick/2 + TrackGap/2);

    %insulation
    FilmThick = 0.02;
    TapeThick = 0.125;
    TapeWidth = 1.0;
    PolycarbThick = 0.25;

    % colors 
    colors.VinylMain    = [0.90 0.90 0.90];
    colors.VinylPanels  = [0.80 0.80 0.80];
    colors.Glass        = [0.40 0.70 0.90 0.30];
    colors.LowEFilm     = [0.20 0.40 0.60 0.40];
    colors.AirGap       = [0.50 1.00 0.50 0.10];
    colors.SteelTape    = [0.40 0.40 0.45];
    colors.MagTape      = [0.25 0.15 0.10];
    colors.Polycarb     = [0.90 0.95 1.00 0.45];

    fprintf('Assembling Habitat Environmental Shield System...\n');

    %outer vinyl frame
    drawBox(ax, 0, VinylThick, 0, TotalHeight, -FrameDepth/2, FrameDepth/2, ...
        colors.VinylMain, 'MainFrame_LeftJamb');
    drawBox(ax, TotalWidth-VinylThick, TotalWidth, 0, TotalHeight, -FrameDepth/2, FrameDepth/2, ...
        colors.VinylMain, 'MainFrame_RightJamb');
    drawBox(ax, VinylThick, TotalWidth-VinylThick, TotalHeight-VinylThick, TotalHeight, -FrameDepth/2, FrameDepth/2, ...
        colors.VinylMain, 'MainFrame_Header');
    drawBox(ax, VinylThick, TotalWidth-VinylThick, 0, VinylThick, -FrameDepth/2, FrameDepth/2, ...
        colors.VinylMain, 'MainFrame_Sill');

    % fixed panel
    FX0 = VinylThick;
    FX1 = FX0 + PanelW;
    FY0 = VinylThick;
    FY1 = FY0 + PanelH;
    FZ = FixedZOffset;

    % fixed sash frame
    drawBox(ax, FX0, FX1, FY0, FY0+VinylThick, FZ-PanelThick/2, FZ+PanelThick/2, ...
        colors.VinylPanels, 'FixedSash_BottomRail');
    drawBox(ax, FX0, FX1, FY1-VinylThick, FY1, FZ-PanelThick/2, FZ+PanelThick/2, ...
        colors.VinylPanels, 'FixedSash_TopRail');
    drawBox(ax, FX0, FX0+VinylThick, FY0+VinylThick, FY1-VinylThick, FZ-PanelThick/2, FZ+PanelThick/2, ...
        colors.VinylPanels, 'FixedSash_LeftStile');
    drawBox(ax, FX1-VinylThick, FX1, FY0+VinylThick, FY1-VinylThick, FZ-PanelThick/2, FZ+PanelThick/2, ...
        colors.VinylPanels, 'FixedSash_RightStile');

    FGX0 = FX0 + VinylThick; FGX1 = FX1 - VinylThick;
    FGY0 = FY0 + VinylThick; FGY1 = FY1 - VinylThick;

    drawBox(ax, FGX0, FGX1, FGY0, FGY1, FZ-0.1, FZ+0.1, ...
        colors.Glass, 'Fixed_Glass');
    drawBox(ax, FGX0, FGX1, FGY0, FGY1, FZ+0.1, FZ+0.1+FilmThick, ...
        colors.LowEFilm, 'Fixed_LowE_Film');

    %stationary side secondary glazing
    FixPoly_ZStart = FZ + PanelThick/2 + TrackGap/4;

    %steel tape
    drawBox(ax, FX0, FX1, FY0, FY0+TapeWidth, FixPoly_ZStart, FixPoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Fixed_SteelTape_Bottom');
    drawBox(ax, FX0, FX1, FY1-TapeWidth, FY1, FixPoly_ZStart, FixPoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Fixed_SteelTape_Top');
    drawBox(ax, FX0, FX0+TapeWidth, FY0+TapeWidth, FY1-TapeWidth, FixPoly_ZStart, FixPoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Fixed_SteelTape_Left');
    drawBox(ax, FX1-TapeWidth, FX1, FY0+TapeWidth, FY1-TapeWidth, FixPoly_ZStart, FixPoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Fixed_SteelTape_Right');

    % magnetic tape perimeter
    FixPoly_ZMag = FixPoly_ZStart + TapeThick;
    drawBox(ax, FX0, FX1, FY0, FY0+TapeWidth, FixPoly_ZMag, FixPoly_ZMag+TapeThick, ...
        colors.MagTape, 'Fixed_MagneticTape_Bottom');
    drawBox(ax, FX0, FX1, FY1-TapeWidth, FY1, FixPoly_ZMag, FixPoly_ZMag+TapeThick, ...
        colors.MagTape, 'Fixed_MagneticTape_Top');
    drawBox(ax, FX0, FX0+TapeWidth, FY0+TapeWidth, FY1-TapeWidth, FixPoly_ZMag, FixPoly_ZMag+TapeThick, ...
        colors.MagTape, 'Fixed_MagneticTape_Left');
    drawBox(ax, FX1-TapeWidth, FX1, FY0+TapeWidth, FY1-TapeWidth, FixPoly_ZMag, FixPoly_ZMag+TapeThick, ...
        colors.MagTape, 'Fixed_MagneticTape_Right');

    FixPoly_ZSheet = FixPoly_ZMag + TapeThick;
    drawBox(ax, FX0+0.125, FX1-0.125, FY0+0.125, FY1-0.125, ...
        FixPoly_ZSheet, FixPoly_ZSheet+PolycarbThick, ...
        colors.Polycarb, 'Fixed_Polycarbonate');

    %empty space, not a physical solid, just for visualization
    drawBox(ax, FGX0, FGX1, FGY0, FGY1, FZ+0.1+FilmThick, FixPoly_ZSheet, ...
        colors.AirGap, 'Fixed_AirGap', false);

    % sliding panel offset 10 units for visualization
    SlideOpenOffset = 10;
    SX0 = VinylThick + PanelW - TapeWidth + SlideOpenOffset;
    SX1 = SX0 + PanelW;
    SY0 = VinylThick;
    SY1 = SY0 + PanelH;
    SZ = SlidingZOffset;

    drawBox(ax, SX0, SX1, SY0, SY0+VinylThick, SZ-PanelThick/2, SZ+PanelThick/2, ...
        colors.VinylPanels, 'SlidingSash_BottomRail');
    drawBox(ax, SX0, SX1, SY1-VinylThick, SY1, SZ-PanelThick/2, SZ+PanelThick/2, ...
        colors.VinylPanels, 'SlidingSash_TopRail');
    drawBox(ax, SX0, SX0+VinylThick, SY0+VinylThick, SY1-VinylThick, SZ-PanelThick/2, SZ+PanelThick/2, ...
        colors.VinylPanels, 'SlidingSash_LeftStile');
    drawBox(ax, SX1-VinylThick, SX1, SY0+VinylThick, SY1-VinylThick, SZ-PanelThick/2, SZ+PanelThick/2, ...
        colors.VinylPanels, 'SlidingSash_RightStile');

    SGX0 = SX0 + VinylThick; SGX1 = SX1 - VinylThick;
    SGY0 = SY0 + VinylThick; SGY1 = SY1 - VinylThick;

    drawBox(ax, SGX0, SGX1, SGY0, SGY1, SZ-0.1, SZ+0.1, ...
        colors.Glass, 'Sliding_Glass');
    drawBox(ax, SGX0, SGX1, SGY0, SGY1, SZ+0.1, SZ+0.1+FilmThick, ...
        colors.LowEFilm, 'Sliding_LowE_Film');

    %% sliding door side surface face secondary glazing
    SlidePoly_ZStart = SZ + PanelThick/2;

    drawBox(ax, SX0, SX1, SY0, SY0+TapeWidth, SlidePoly_ZStart, SlidePoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Sliding_SteelTape_Bottom');
    drawBox(ax, SX0, SX1, SY1-TapeWidth, SY1, SlidePoly_ZStart, SlidePoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Sliding_SteelTape_Top');
    drawBox(ax, SX0, SX0+TapeWidth, SY0+TapeWidth, SY1-TapeWidth, SlidePoly_ZStart, SlidePoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Sliding_SteelTape_Left');
    drawBox(ax, SX1-TapeWidth, SX1, SY0+TapeWidth, SY1-TapeWidth, SlidePoly_ZStart, SlidePoly_ZStart+TapeThick, ...
        colors.SteelTape, 'Sliding_SteelTape_Right');

    SlidePoly_ZMag = SlidePoly_ZStart + TapeThick;
    drawBox(ax, SX0, SX1, SY0, SY0+TapeWidth, SlidePoly_ZMag, SlidePoly_ZMag+TapeThick, ...
        colors.MagTape, 'Sliding_MagneticTape_Bottom');
    drawBox(ax, SX0, SX1, SY1-TapeWidth, SY1, SlidePoly_ZMag, SlidePoly_ZMag+TapeThick, ...
        colors.MagTape, 'Sliding_MagneticTape_Top');
    drawBox(ax, SX0, SX0+TapeWidth, SY0+TapeWidth, SY1-TapeWidth, SlidePoly_ZMag, SlidePoly_ZMag+TapeThick, ...
        colors.MagTape, 'Sliding_MagneticTape_Left');
    drawBox(ax, SX1-TapeWidth, SX1, SY0+TapeWidth, SY1-TapeWidth, SlidePoly_ZMag, SlidePoly_ZMag+TapeThick, ...
        colors.MagTape, 'Sliding_MagneticTape_Right');

    SlidePoly_ZSheet = SlidePoly_ZMag + TapeThick;
    drawBox(ax, SX0+0.125, SX1-0.125, SY0+0.125, SY1-0.125, ...
        SlidePoly_ZSheet, SlidePoly_ZSheet+PolycarbThick, ...
        colors.Polycarb, 'Sliding_Polycarbonate');

    % more empty space
    drawBox(ax, SGX0, SGX1, SGY0, SGY1, SZ+0.1+FilmThick, SlidePoly_ZSheet, ...
        colors.AirGap, 'Sliding_AirGap', false);

    %pllot formatting
    title(ax, 'Habitat Hull Engineering: Multi-Layer Window Insulation System', ...
        'Color', 'w', 'FontSize', 14);
    xlabel(ax, 'Width Axis (X - Inches)', 'Color', 'w');
    ylabel(ax, 'Height Axis (Y - Inches)', 'Color', 'w');
    zlabel(ax, 'Environmental Isolation Depth Axis (Z - Inches)', 'Color', 'w');
    set(ax, 'Color', [0.1 0.1 0.1], 'XColor', 'w', 'YColor', 'w', 'ZColor', 'w');
    set(ax, 'GridColor', [0.3 0.3 0.3], 'GridAlpha', 0.5);
    xlim(ax, [-5, TotalWidth+5]);
    ylim(ax, [-5, TotalHeight+5]);
    zlim(ax, [-5, 5]);

    % the legend only patches are not tagged for export on purpose
    dummy_handles = [
        patch(ax, NaN, NaN, colors.VinylMain, 'FaceAlpha', 1), ...
        patch(ax, NaN, NaN, colors.VinylPanels, 'FaceAlpha', 1), ...
        patch(ax, NaN, NaN, colors.Glass(1:3), 'FaceAlpha', 0.5), ...
        patch(ax, NaN, NaN, colors.LowEFilm(1:3), 'FaceAlpha', 0.6), ...
        patch(ax, NaN, NaN, colors.AirGap(1:3), 'FaceAlpha', 0.2), ...
        patch(ax, NaN, NaN, colors.SteelTape, 'FaceAlpha', 1), ...
        patch(ax, NaN, NaN, colors.MagTape, 'FaceAlpha', 1), ...
        patch(ax, NaN, NaN, colors.Polycarb(1:3), 'FaceAlpha', 0.7)
    ];
    legend(ax, dummy_handles, { ...
        'Vinyl Main Frame', 'Door Sash Frame Profiles', 'Primary Glass Pane', ...
        'Barrier 1: Low-E Radiant Film', 'Inert Air Gap (visualization only)', ...
        'Structural Self-Adhesive Steel Tape', 'Heavy-Duty Magnetic Coupling Tape', ...
        'Barrier 2: Impact Polycarbonate Panel' ...
    }, 'TextColor', 'w', 'Color', [0.2 0.2 0.2], ...
       'Location', 'northeastoutside');

    % export cad data
    % json should contain only physical components. Air gaps and legend patches
    % are omitted & coordinates are changed from inches to millimeters.
    exportComponentsToJSON(ax, 'HabitatDoor_components.json', 25.4);

    fprintf('Assembly and CAD geometry export complete.\n');
end


function drawBox(ax, x1, x2, y1, y2, z1, z2, colorMat, componentName, exportSolid)
    if nargin < 9 || isempty(componentName)
        componentName = 'Unassigned';
    end
    
    
    if nargin < 10 || isempty(exportSolid)
        exportSolid = true;
    end

    



    if ~(x2 > x1 && y2 > y1 && z2 > z1)
        warning('Skipping invalid or zero-thickness box: %s', componentName);
        return;
    end

    vertices = [
        x1 y1 z1;
        x2 y1 z1;
        x2 y2 z1;
        x1 y2 z1;
        x1 y1 z2;
        x2 y1 z2;
        x2 y2 z2;
        x1 y2 z2
    ];

    
    faces = [
        1 4 3 2;
        5 6 7 8;
        1 2 6 5;
        2 3 7 6;
        3 4 8 7;
        4 1 5 8
    ];

    if numel(colorMat) == 4
        h = patch(ax, 'Vertices', vertices, 'Faces', faces, ...
            'FaceColor', colorMat(1:3), 'FaceAlpha', colorMat(4), ...
            'EdgeColor', 'none');
    else
        h = patch(ax, 'Vertices', vertices, 'Faces', faces, ...
            'FaceColor', colorMat, 'FaceAlpha', 1.0, ...
            'EdgeColor', [0.2 0.2 0.2], 'LineWidth', 0.5);
    end

    % store box bounds, identity, export flag on this patch.
    h.UserData = struct( ...
        'ComponentName', char(componentName), ...
        'ExportSolid', logical(exportSolid), ...
        'BoundsInches', [x1 x2 y1 y2 z1 z2]);
end


function exportComponentsToJSON(ax, filename, scaleFactor)
    % Export one record per physical box. No mesh reconstruction is needed:
    % FreeCAD can recreate each rectangular solid from its six bounds.

    patchHandles = findobj(ax, 'Type', 'patch');
    components = struct('name', {}, 'bounds_mm', {});

    for k = 1:numel(patchHandles)
        h = patchHandles(k);
        metadata = h.UserData;

        % rest of this is mostly written for exporting
        if ~isstruct(metadata) || ...
                ~isfield(metadata, 'ExportSolid') || ...
                ~isfield(metadata, 'ComponentName') || ...
                ~isfield(metadata, 'BoundsInches')
            continue;
        end

        % skipping air gaps.
        if ~metadata.ExportSolid
            continue;
        end

        b = metadata.BoundsInches;
        bmm = b * scaleFactor;

        item.name = metadata.ComponentName;
        item.bounds_mm = bmm;
        components(end+1) = item; 
    end

    exportData = struct();
    exportData.units = 'mm';
    exportData.source_units = 'inches';
    exportData.description = 'Habitat door physical components; air gaps excluded';
    exportData.components = components;

    jsonText = jsonencode(exportData);

    fid = fopen(filename, 'w');
    if fid < 0
        error('Could not open JSON output file: %s', filename);
    end

    cleanupObj = onCleanup(@() fclose(fid));
    fwrite(fid, jsonText, 'char');

    fprintf('CAD export: %d physical rectangular components written to %s\n', ...
        numel(components), filename);
    fprintf('Air-gap volumes were excluded from the export.\n');
end
