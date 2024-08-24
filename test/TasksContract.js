const TasksContract = artifacts.require("TasksContract");

//Creo el primer testing
TasksContract("TasksContract", () => {
    before(async () => {
        this.tasksContract = await TasksContract.deployed();
    })

    it("migrate deployed succesfully", async () => {
        const address = await this.tasksContract.address;
        assert.notEqual(address, null);
        assert.notEqual(address, "");
        assert.notEqual(address, undefined);
        assert.notEqual(address, 0x0);
        assert.notEqual(address, "0x0");
    })
})