const { expect } = require("chai");

describe("MyOpportunity", function() {
  it("Should return the new greeting once it's changed", async function() {
    const MyOpportunity = await ethers.getContractFactory("MyOpportunity");
    const myOpportunity = await MyOpportunity.deploy();
    
    await myOpportunity.deployed();
    expect(myOpportunity.address);
  });
});
