pragma solidity ^0.8.0;
contract Ecole {
uint public Elevecount;//return the numbers of Students
address public owner;//address of owner
uint public EleveCertifie;////return the numbers of Students Certifie

constructor(){
    Elevecount=0;
    EleveCertifie=0;
    owner=msg.sender;
} 
    struct Eleve{
        string Nom;//LastName of Student
        string prenom;//FirstName
        uint256 Note;//Mark in the Exams
        bool Certif;//get Certificat
        uint id;//index of student
    }
     mapping(uint256=>Eleve) List;//pointer Students inside List
    Eleve[] Lists;//Lists of Students Vide
    function Add( string memory Nom, string memory prenom, uint256 Note) public {
     require(msg.sender==owner,"only owner of smart contract can add a new Student");
     require(Note>=0 && Note<=20);//Marks should be between 0 and 20
     Eleve storage newEtud = List[Elevecount];//Add new Student
     newEtud.Nom=Nom;//Add Last Name
     newEtud.prenom=prenom;//Add Name
     newEtud.Note=Note;//Add Mark
     if (newEtud.Note>=10){
         newEtud.Certif=true;//if student get Mark superior than 10 he get certificat
         EleveCertifie++;//increment the number of Student Certifie
     }
     else {
         newEtud.Certif=false;//else student didn't get Certificat
     }
     newEtud.id=Elevecount;//increment the index of Student when we add new Student
     Elevecount++;   //increment the number of Student
    
    }
    function setlist () public {//Add Students certifie to another List
    require(msg.sender==owner);
        for(uint i=0; i<Elevecount;i++){//browse students id
        Eleve storage E = List[i];//get the student in the list
        if (E.Certif==true){//if student is Certifie
            Lists.push(E);//push to the new List
            
        }    
    }
    }
  
    function getlist(uint id) public view returns (string memory,string memory,uint256,bool){//return the lastName,FirstName,Mark,Certif of students certifie
        require(id<EleveCertifie);//id should be inferieur than numbers of Students certifie 
        
        Eleve storage E = Lists[id];//get the student that got this id
        return(E.Nom,E.prenom,E.Note,E.Certif);//return the Student

    }          
    }


