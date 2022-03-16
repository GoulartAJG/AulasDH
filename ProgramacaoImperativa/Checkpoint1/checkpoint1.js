// Checkpoint 1 - Programação imperativa - Microondas.
// Criado por Alan José Goulart
// Criado em 16/03/2022


const TimerPlate = (Number, TimeUser) => {
    let StandardTime;

    switch (Number) {
        case 1:
            console.log("Você escolheu Pipoca.");
            StandardTime = 10;
            break
        case 2:
            console.log("Você escolheu Macarrão.");
            StandardTime = 8;
            break
        case 3:
            console.log("Você escolheu Carne.");
            StandardTime = 15;
            break
        case 4:
            console.log("Você escolheu Feijão.");
            StandardTime = 12;
            break
        case 5:
            console.log("Você escolheu Brigadeiro.");
            StandardTime = 8;
            break
        default:
            return console.log("Prato Inexistente.");
    };

    console.log(`Este prato leva ${StandardTime}s para ficar pronto.\nVocê selecionou ${TimeUser}s no microondas.`);

    // Condições - Tempo correto ou aproximado / 2x maior que o tempo padrão /Abaixo do tempo.
    const PlateCondition1 = (TimeUser < StandardTime);
    const PlateCondition2 = ((TimeUser === StandardTime) || (TimeUser <= (StandardTime * 2)));
    const PlateCondition3 = ((TimeUser > (StandardTime * 2)) && (TimeUser < (StandardTime * 3)));

    // Estrutura Condicional - Define o estado final do prato.
    let condicional = (PlateCondition1) ? console.log("Tempo insuficiente.") :
        (PlateCondition2) ? console.log("Prato pronto, bom apetite!!!") :
            (PlateCondition3) ? console.log("A comida queimou.") :
                console.log("💥 kabummmmmmmmmm 💥");

    return condicional;
};


    // Testes.

TimerPlate(1, 8);
TimerPlate(2, 18);
TimerPlate(3, 30);
TimerPlate(4, 60);
TimerPlate(5, 12);
TimerPlate(15, 80);
