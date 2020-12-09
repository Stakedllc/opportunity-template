const { expect } = require("chai");

describe("MyOpportunity", function() {
  it("Should deploy and have an address", async function() {
    const MyOpportunity = await ethers.getContractFactory("MyOpportunity");
    const myOpportunity = await MyOpportunity.deploy();
    
    await myOpportunity.deployed();
    expect(myOpportunity.address);
  });
});
