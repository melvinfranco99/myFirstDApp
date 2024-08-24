// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6; //Mirar la version/

//CTRL+L para limpiar la consola de 'truffle console'
contract TasksContract {
    uint public taskCounter = 0;

    //Voy a crear mi primera tarea según despliego el contrato
    constructor() {
        createTask("Tarea 0", "respirar");
    }

    event TaskCreated(
        uint id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskToggleDone(uint id, bool done);

    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint createdAt;
    }

    mapping(uint => Task) public tasks;

    function createTask(
        string memory _title,
        string memory _description
    ) public {
        tasks[taskCounter] = Task(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );

        emit TaskCreated(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
        taskCounter++;
    }

    /*Para ver el cambio debo primero: guardar el cambio en una variable, por ejemplo 'resultado0'.
    Y luego entrar en esa variable, en logs, en el primer objeto [0], en 'args' y en 'done' "resultado0.logs[0].args.done"*/
    function toggleDone(uint _id) public {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggleDone(_id, _task.done);
    }
}
