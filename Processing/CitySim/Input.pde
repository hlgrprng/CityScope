JSONArray nodesJSON;
  // All "Input" Nodes are initially loaded as elements in the 'nodesJSON' JSON Array  
  // Element properties include:
  //
  // 'use'  
  //   0 = Ground: Open
  //   1 = Ground: Street
  //   2 = Ground: Park
  //   3 = Building: Live
  //   4 = Building: Work
  //   -2 = Water
  // 'u'    
  // 'v'
  // 'z'
  // 'u_m'  [meters]
  // 'v_m'  [meters]
  // 'z_m'  [meters]

// For any given node input, height of maxZ is calculated
int maxU, maxV, maxZ;

//Input metaData
JSONObject metaData;
  // Meters per Node
  float nodeW, avgNodeW, nodeH;
  // Max Extent Values
  int maxPieces, maxLU_W, maxLU_H, nodesU, nodesV, numNodes;

// Initialize Input and Output Arrays
void initializeInputJSON() {
  //Input Nodes
  nodesJSON = new JSONArray();
  
  //Input MetaData
  metaData = new JSONObject();
}

// Loads Input nodes from 'legotizer_data' folder
void loadInput(String filename, int viz) {
  nodesJSON = loadJSONArray(legotizer_data + demoPrefix + demos[viz] + filename); 
  numNodes = nodesJSON.size();
  println(numNodes + " nodes loaded.");
  

  // Calculate maxU, maxV, maxZ
  maxZ = 0;
  for (int i=0; i<nodesJSON.size(); i++) {
    JSONObject node = nodesJSON.getJSONObject(i); 
    if (node.getInt("z") > maxZ) {
      maxZ = node.getInt("z");
    }
  }
  // makes sure that current 'zee' value is not out of bounds
  if (zee > maxZ) {
    zee = maxZ;
  }
  
  metaData = loadJSONObject(legotizer_data + demoPrefix + demos[viz] + "metadata.json");
  // width of a node in meters, definied by lego unit width
  nodeW = metaData.getInt("dynNodeW");
  // height of a node in meters
  nodeH = metaData.getInt("dynNodeH");
  // Average distance between nodes in meters when accounting for plastic grid spacer that may exist
  avgNodeW = metaData.getInt("avgDynNodeW");
  // Max possible pieces in one dimension of a node dataset
  maxPieces = metaData.getInt("maxPieces");
  // Max possible width of piece in a node dataset
  maxLU_W = metaData.getInt("maxLU_W");
  // Max possible height of any node dataset
  maxLU_H = metaData.getInt("maxLU_H");
  // Max nodes in U direction
  nodesU = metaData.getInt("nodesU");
  // Max nodes in V direction
  nodesV = metaData.getInt("nodesV");
}
