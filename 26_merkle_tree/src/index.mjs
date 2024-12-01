import { StandardMerkleTree } from "@openzeppelin/merkle-tree";

// (1)
//playerA 
/**
 * struct Cell {
  uint8 id;
  uint8 status;
  uint240 nonce;
}

struct Attack {
  uint8 target;
  uint248 nonce;
}

 */
const playerACell = [
  ["0x1", "0x2","0x0"],
  ["0x2", "0x2","0x0"],
  ["0x3", "0x2","0x0"]
];
const playerBCell = [
    ["0x1", "0x2","0x0"],
    ["0x2", "0x2","0x0"],
    ["0x3", "0x2","0x0"]
];
const playerAAttack = [
    ["0x1", "0x0"],
    ["0x2", "0x0"],
    ["0x3", "0x0"]
];
const playerBAttack = [
    ["0x1", "0x0"],
    ["0x2", "0x0"],
    ["0x3", "0x0"]
];

// (2)
const treeACell = StandardMerkleTree.of(playerACell, ["uint8", "uint8","uint240"]);
const treeBCell = StandardMerkleTree.of(playerBCell, ["uint8", "uint8","uint240"]);
const treeAAttack = StandardMerkleTree.of(playerAAttack, ["uint8", "uint248"]);
const treeBAttack = StandardMerkleTree.of(playerBAttack, ["uint8", "uint248"]);


// (3)
console.log('Merkle Root:', treeACell.root);
console.log('Merkle Root:', treeBCell.root);
console.log('Merkle Root:', treeAAttack.root);
console.log('Merkle Root:', treeBAttack.root);

//A -> B
console.log(treeAAttack.getProof(0));
