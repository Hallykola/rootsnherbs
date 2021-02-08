<?php
include_once('./models/TransactionsModel.php');
include_once('./models/UsersModel.php');
include_once('./models/BonusesModel.php');
include_once('./models/PensionsModel.php');
include_once('./models/RanksModel.php');
require 'vendor/autoload.php';

class RanknBonusController{
    
    function rankin($myrank,$ranks){
        $x = 0;
        foreach($ranks as $item){
            /*foreach($item as $itema){
                if($myrank == $itema){
                    $x += 1;
                }
            }*/
           if(in_array($myrank, $item)){
               $x += 1;
           }
        }
        return $x;
    }
    function totalbv($mybv){
        $y = 0;
        foreach($bv as $itemb){
            $y += $itemb;
        }
        return $y;

    }
    function eachmorethan($mybv, $abv){
        $z = 0;
        foreach($mybv as $itemc){
            if($itemc>= $abv){
                $z +=1;
            }
        }
        return $z;
    }
    function grade($userid){
            $jjc = FALSE;
            $play1 = new UsersModel();
            $allusers = $play1->getAllUsers();
            $tree = new BlueM\Tree($allusers);
            $node = $tree->getNodeById($userid);
            $ancestors = $node->getAncestorsAndSelf();
            $chairmanid = $userid ;
            $chairmanbv = $node->get('bronzevalue');
            foreach ($ancestors as $item){
                if($item->get('id')!=0){
            $children = $item->getChildren();
            $childrencount = count($children);
            $bvbychild = array();
            $ranksbychild = array();
            foreach ($children as $item1){
                $mydesc = $item1->getDescendantsAndSelf();
                
                $bv = 0;
                foreach($mydesc as $item2){
                    $bv += $item2->get('bronzevalue');
                }
                $bvbychild [] = $bv; 
                
                $rank = array();
                foreach($mydesc as $item2){
                    $rank[] = $item2->get('rank');
                }
                $ranksbychild[] = $rank;
            }

        

    // grading logic

      $level = "none";
      switch (0){
          case 0:
            if($item->get('bronzevalue') >=100){
                $level = "BRONZE";
            }else{
                break;
            }
        case 1:
            if($item->get('bronzevalue') >=300){
                $level = "SAPPHIRE" ;
            }else{
                break;
            }
        case 2:
            if(($childrencount>=4 && $this->eachmorethan($bvbychild, 300)>=4)||($childrencount>=3 && $this->eachmorethan($bvbychild, 500)>=3)){
                $level = "RUBY" ;
            }else{
                break;
            }
        case 3:
            if(($this->rankin("RUBY",$ranksbychild)>=4 && $this->totalbv($bvbychild)>=4800)||($this->rankin("RUBY",$ranksbychild)>=3 && $this->totalbv($bvbychild)>=9600)){
                $level = "SILVER" ;
            }else{
                break;
            }
        case 4:
            if(($this->rankin("SILVER",$ranksbychild)>=4 && $this->totalbv($bvbychild)>=19200)||($this->rankin("SILVER",$ranksbychild)>=3 && $this->totalbv($bvbychild)>=38400)){
                $level = "DIAMOND" ;
            }else{
                break;
            }
        case 5:
            if(($this->rankin("DIAMOND",$ranksbychild)>=4 && $this->totalbv($bvbychild)>=76000)){
                $level = "GOLD" ;
            }else{
                break;
            }
        case 6:
            if(($this->rankin("GOLD",$ranksbychild)>=4 && $this->totalbv($bvbychild)>=307200)){
                $level = "GENERAL" ;
            }else{
                break;
            }
        case 7:
            if(($this->rankin("GENERAL",$ranksbychild)>=3 && $this->totalbv($bvbychild)>=1200000)){
                $level = "ONE STAR GENERAL" ;
            }else{
                break;
            }
        case 8:
            if(($this->rankin("ONE STAR GENERAL",$ranksbychild)>=3 && $this->totalbv($bvbychild)>=4900000)){
                $level = "TWO STAR GENERAL" ;
            }else{
                break;
            }
        case 9:
            if(($this->rankin("TWO STAR GENERAL",$ranksbychild)>=3 && $this->totalbv($bvbychild)>=19000000)){
                $level = "THREE STAR GENERAL" ;
            }
      }
      
    // save/update level in users table
    if(strtoupper($item->get('rank'))!=strtoupper($level)){
        
    $play1->updateUserItembyID ('rank','si',$level,$item->get('id'));
    $ranker = new RanksModel();
    $ranker->addRank($item->get('name'), $item->get('id') ,$item->get('rank') , $level);      
    //pay first time direct bonus to new sapphires (>300bv)  
    if(strtoupper($level)=='SAPPHIRE'){
        $this->payfirsttimer($item,0.20*$item->get('bronzevalue'), 'First time Direct bonus');
        $jjc = TRUE ;
    }
}
            }
        }
        return $jjc;
        }

        function pay($person, $amount, $description){
            $famount = number_format($amount - 0.02*$amount, 2); //remove bank charges
            $penamount = number_format($famount* 0.05, 2);  //user pension contribution
            $compenamount = number_format($penamount* 0.20, 2); //company pension addition
            $totalpension = number_format($penamount + $compenamount, 2); //company plus user
            $nonpensioneramount = $famount;
            $pensioneramount = number_format($famount - $penamount, 2); //charges and pension removed
            if($person->get('id')!=0){
            $eligible4pension = array('SAPPHIRE','RUBY','SILVER','DIAMOND','GOLD','GENERAL','ONE STAR GENERAL','TWO STAR GENERAL','THREE STAR GENERAL');
            $bonusmaker = new BonusesModel();
            $pensionmaker = new PensionsModel();
            $transactionid = 10;//$transactionid->fetch_assoc()['LAST_INSERT_ID()'];
            $play1 = new UsersModel();
            if(in_array($person->get('rank'),$eligible4pension)){
            //$amount -= 0.07*$amount; 
            //$penamount  = 0.05*$amount + (0.05*$amount* 0.2);
            $bonusmaker->addBonus($person->get('name'),$person->get('id'),$pensioneramount, $transactionid,$description,'Pension deducted');
            $pensionmaker->addPension($person->get('name'),$person->get('id'),$totalpension, date('F,Y'),$description,'Pension');
            
            $play1->updateUserItembyID ('bonusvalue','di',$person->get('bonusvalue')+$pensioneramount,$person->get('id'));
            $play1->updateUserItembyID ('pensionvalue','di',$person->get('pensionvalue')+$totalpension,$person->get('id'));

            }else{
               
                //$amount -= 0.02*$amount;
                //print $amount;
            $bonusmaker->addBonus($person->get('name'),$person->get('id'),$nonpensioneramount, $transactionid,$description,'Pension not deducted');
            $play1->updateUserItembyID ('bonusvalue','di',$person->get('bonusvalue')+$nonpensioneramount,$person->get('id'));
               
            }
        }
    }

    function payfirsttimer($person, $amount, $description){
        $famount = number_format($amount - 0.02*$amount, 2); //remove bank charges
        $penamount = number_format($famount* 0.05, 2);  //user pension contribution
        $compenamount = number_format($penamount* 0.20, 2); //company pension addition
        $totalpension = number_format($penamount + $compenamount, 2); //company plus user
        $nonpensioneramount = $famount;
        $pensioneramount = number_format($famount - $penamount, 2); //charges and pension removed
        if($person->get('id')!=0){
        $bonusmaker = new BonusesModel();
        $pensionmaker = new PensionsModel();
        $transactionid = 10;//$transactionid->fetch_assoc()['LAST_INSERT_ID()'];
        $play1 = new UsersModel();
        //begin payment
        $bonusmaker->addBonus($person->get('name'),$person->get('id'),$pensioneramount, $transactionid,$description,'Pension deducted');
        $pensionmaker->addPension($person->get('name'),$person->get('id'),$totalpension, date('F,Y'),$description,'Pension');
        
        $play1->updateUserItembyID ('bonusvalue','di',$person->get('bonusvalue')+$pensioneramount,$person->get('id'));
        $play1->updateUserItembyID ('pensionvalue','di',$person->get('pensionvalue')+$totalpension,$person->get('id'));

        
    }
}
        function payregistration($sponsor, $amount, $description){
            $play1 = new UsersModel();
            $allusers = $play1->getAllUsers();
            $tree = new BlueM\Tree($allusers);
            $person = $tree->getNodeById($sponsor);
            $eligible4pension = array('SAPPHIRE','RUBY','SILVER','DIAMOND','GOLD','GENERAL','ONE STAR GENERAL','TWO STAR GENERAL','THREE STAR GENERAL');
            $bonusmaker = new BonusesModel();
            $transactionid = 12;
            $this->pay($person, $amount, $description);
        }

        function paybonuses($userid,$thisbv,$jjc){
            $play1 = new UsersModel();
            $allusers = $play1->getAllUsers();
            $tree = new BlueM\Tree($allusers);
            $node = $tree->getNodeById($userid);
            $ancestors = $node->getAncestors();
            $chairmanid = $userid ;
            $chairmanbv = $node->get('bronzevalue');
            $father = $node->getParent();
            $eligible4indirect = array('RUBY','SILVER','DIAMOND','GOLD','GENERAL','ONE STAR GENERAL','TWO STAR GENERAL','THREE STAR GENERAL');
            $eligible4direct = array('SAPPHIRE','RUBY','SILVER','DIAMOND','GOLD','GENERAL','ONE STAR GENERAL','TWO STAR GENERAL','THREE STAR GENERAL');

            
            //direct bonus
            if (!$jjc){
            if($node->get('id')!=0){
            if(in_array($node->get('rank'),$eligible4direct)){
            $this->pay($node, number_format(0.20*$thisbv), 'Direct bonus');
            }
        }
    }
            //indirect bonus
            $x = 0;
            foreach ($ancestors as $item){
                if($item->get('id')!=0){
                if(in_array($item->get('rank'),$eligible4indirect)){
                switch ($x) {
                    case 0:
                        $this->pay($item, number_format(0.1*$thisbv, 2),'1st Gen. Indirect bonus');
                        break;
                    case 1:
                        $this->pay($item,number_format( 0.08*$thisbv, 2),'2nd Gen. Indirect bonus');
                         break;
                    case 2:
                        $this->pay($item,number_format( 0.05*$thisbv, 2),'3rd Gen. Indirect bonus');
                        break;
                    case 3:
                        $this->pay($item, number_format(0.03*$thisbv, 2),'4th Gen. Indirect bonus');
                        break;
                    case 4:
                        $this->pay($item, number_format(0.02*$thisbv, 2),'5th Gen. Indirect bonus');
                        break;
                    default:
                        break;
                    }
                }
                if($x>4){
                    break;
                }
               
            }
        }

        } 
    }
    

?>