void setMode() {
  if (vizMode == 0) {
    kendallMode();
  } else if (vizMode == 1) {
    riyadhMode();
  } else if (vizMode == 2) {
    flindersMode();
  }
} 

void changeDemo() {
  if (vizMode < 2) {
    vizMode++;
  } else {
    vizMode = 0;
  }
  loading(name[vizMode]);
  vizChange = true;
}

void riyadhMode() {
  vizMode = 1;
  loadSite();
  loadStaticStructures();
  
  staticSpacer = 1;        // Plastic Spacer Needed for Static buildings
  dynamicSpacer = 1;       // Plastic Spacer Needed for Dynamic buildings
  UMax = 16;
  VMax = 16;
  updateBoard();
  
  structureMode = 1;
  useCloud.wipeNodes();
  setRiyadhPieces();
  displaySatellite = true;
  satMode = 1;
  drawPlanSat = true;
  drawPlanStatic = false;
  displayScoreWeb = true;
  overrideStatic = true;
  displayStatic = true;
  displayDynamic = true;
  
  pieceW_LU = 4;
  pieceH_LU = 1; 
  staticBaseH_LU = 3;  // [LU] number of lego units high for base
  staticBasePlate = 0; // 0 has thin gray lego baseplate; 1 does have thin gray lego baseplate
  dynamicBaseH_LU = 3; // [LU] number of lego units high for base
  calcDimensions();
  
  staticH_LU = 1;
  staticW_LU = 1;
  
  useCloud.wipeNodes();
  updateAllNodes();
  saveMetaJSON("metadata.json");
}

void kendallMode() {
  vizMode = 0;
  loadSite();
  loadStaticStructures();  
  
  staticSpacer = 0;        // Plastic Spacer NOT Needed for Static buildings
  dynamicSpacer = 1;       // Plastic Spacer Needed for Dynamic buildings
  UMax = 44;
  VMax = 44;
  updateBoard();
  
  structureMode = 0;
  setKendallPieces();
  displaySatellite = true;
  satMode = 1;
  drawPlanSat = false;
  drawPlanStatic = true;
  displayScoreWeb = false;
  overrideStatic = false;
  displayStatic = true;
  displayDynamic = true;
  
  pieceW_LU = 4;
  pieceH_LU = 3;
  staticBaseH_LU = 3;  // [LU] number of lego units high for base
  staticBasePlate = 1; // 0 has thin gray lego baseplate; 1 does have thin gray lego baseplate
  dynamicBaseH_LU = 4; // [LU] number of lego units high for base
  calcDimensions();
  
  staticH_LU = 3;
  staticW_LU = 1;
  
  useCloud.wipeNodes();
  updateAllNodes();
  saveMetaJSON("metadata.json");
}

void flindersMode() {
  vizMode = 2;
  loadSite();
  loadStaticStructures();  
  
  staticSpacer = 0;        // Plastic Spacer NOT Needed for Static buildings
  dynamicSpacer = 0;       // Plastic Spacer NOT Needed for Dynamic buildings
  UMax = 48;
  VMax = 48;
  updateBoard();
  
  structureMode = 0;
  setFlindersPieces();
  displaySatellite = true;
  satMode = 2;
  drawPlanSat = false;
  drawPlanStatic = true;
  displayScoreWeb = false;
  overrideStatic = false;
  displayStatic = true;
  displayDynamic = true;
  
  pieceW_LU = 1;
  pieceH_LU = 1;
  staticBaseH_LU = 1;  // [LU] number of lego units high for base
  staticBasePlate = 0; // 0 has thin gray lego baseplate; 1 does have thin gray lego baseplate
  dynamicBaseH_LU = 1; // [LU] number of lego units high for base
  calcDimensions();
  
  staticH_LU = 1;
  staticW_LU = 1;
  
  useCloud.wipeNodes();
  updateAllNodes();
  saveMetaJSON("metadata.json");
}