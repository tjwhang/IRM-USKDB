import chalk from 'chalk';
import readline from 'readline';

console.clear()

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function title() {
  console.log("====================================")
  console.log("        * USK 정보 데이터베이스       ")
  console.log("====================================")
}

function login() {
    return new Promise((resolve) => {
        rl.question(chalk.yellow("암호: "), (answer) => {
            if (answer === "admin") {
                console.log(chalk.green("사용자 이름이 확인되었습니다."));
                resolve(true);
            } else {
                resolve(false);
            }
        });
    });
}

async function greeting() {
    console.log(chalk.green("USK 정보 데이터베이스에 오신 것을 환영합니다."));
    console.log(chalk.yellow("접속을 진행합니까?") + "(Y 이외의 입력은 모두 부정으로 간주합니다.) ");
    console.log(chalk.red("주의! 허가되지 않은 인원의 접근은 Berryman-Langford 밈적 살해인자로 인해 즉시 미르화로 이어질 수 있습니다."));
    
    rl.question("", async (answer) => {
        if (answer.toUpperCase() === "Y") {
            console.log(chalk.green("접속을 진행합니다."));
            console.log(chalk.green("로그인이 필요합니다."));
            const success = await login();
            if (success) {
                console.log(chalk.green("로그인에 성공하였습니다."));
            } else {
                console.log(chalk.red("로그인에 실패하였습니다."));
                console.log(chalk.red("프로그램을 종료합니다."));
            }
            rl.close();
        } else {
            console.log(chalk.red("접속을 취소합니다."));
            console.log(chalk.red("프로그램을 종료합니다."));
            rl.close();
        }
    });
}

title()
greeting()