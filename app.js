document.addEventListener("DOMContentLoaded", () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contractAddress = 'YOUR_CONTRACT_ADDRESS_HERE';
    const contractABI = [
        // ABI goes here
    ];

    let gradeBookContract;

    document.getElementById("connectButton").onclick = async () => {
        await provider.send("eth_requestAccounts", []);
        gradeBookContract = new ethers.Contract(contractAddress, contractABI, signer);
        console.log("Connected to MetaMask");
    };

    document.getElementById("addGradeButton").onclick = async () => {
        const studentName = document.getElementById("studentName").value;
        const subject = document.getElementById("subject").value;
        const grade = parseInt(document.getElementById("grade").value);
        await gradeBookContract.addGrade(studentName, subject, grade);
        console.log("Grade added");
    };

    document.getElementById("updateGradeButton").onclick = async () => {
        const studentName = document.getElementById("updateStudentName").value;
        const subject = document.getElementById("updateSubject").value;
        const grade = parseInt(document.getElementById("updateGrade").value);
        await gradeBookContract.updateGrade(studentName, subject, grade);
        console.log("Grade updated");
    };

    document.getElementById("getGradeButton").onclick = async () => {
        const studentName = document.getElementById("getGradeStudentName").value;
        const subject = document.getElementById("getGradeSubject").value;
        const grade = await gradeBookContract.getGrade(studentName, subject);
        document.getElementById("gradeOutput").innerText = `Grade: ${grade}`;
    };

    document.getElementById("avgGradeButton").onclick = async () => {
        const subject = document.getElementById("avgSubject").value;
        const avgGrade = await gradeBookContract.averageGrade(subject);
        document.getElementById("avgGradeOutput").innerText = `Average Grade: ${avgGrade}`;
    };
});
