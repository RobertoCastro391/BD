# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
(π Pname, Pnumber (project) ⨝Pnumber=Pno works_on) ⨝Essn=Ssn (π Fname,Lname,Ssn  (employee))
```


### *b)* 

```
π Fname,Minit,Lname,employee.Ssn (employee ⨝ employee.Super_ssn=supervisor.Ssn (ρ supervisor (π Ssn (σ (Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes') (employee)))))
```


### *c)* 

```
γ Pnumber,Pname; THours←sum(Hours) (project⨝Pnumber=Pno works_on)
```


### *d)* 

```
π Fname,Minit,Lname σ Dnumber=3 ∧ Hours>20 ∧ Pname='Aveiro Digital' (employee ⨝ Ssn=Essn ((project⨝ Pnumber=Pno works_on)⨝ Dnum=Dnumber department))
```


### *e)* 

```
π Fname, Minit,Lname (σ Pnumber=null (employee⟕ Ssn=Essn (project⨝Pnumber=Pno works_on)))
```


### *f)* 

```
γ Dname; avg(Salary)-> AvgSalaray σ Sex='F' (department⨝ Dno=Dnumber employee)
```

        
### *g)* 

```
π Fname,Minit,Lname σ numero>2 (γ Fname,Minit,Lname; count(Essn)-> numero (dependent⨝ Ssn=Essn employee))
```


### *h)* 

```
π Fname,Minit,Lname σ numDepenent=0 γ Ssn, Fname, Minit, Lname; count(dependent.Essn)-> numDepenent σ (department.Mgr_ssn=employee.Ssn) (employee ⟕ Ssn=Essn dependent ⨝ department)
```


### *i)* 

```
π Fname,Minit,Lname,Address σ Dlocation≠'Aveiro' ∧ Plocation = 'Aveiro' (employee⨝Ssn=Essn (works_on ⨝ Pnumber=Pno (project⨝ Dnum=Dnumber dept_location)))
```


## ​Problema 5.2

### *a)*

```
π nome σ numero=0 (γ nome; count(fornecedor)->numero (fornecedor⟕ nif=fornecedor encomenda))
```

### *b)* 

```
γ codProd; avg(unidades)->MEDIA item
```


### *c)* 

```
γ avg(totalProd)-> media  (γ numEnc; count(numEnc)-> totalProd (item))
```


### *d)* 

```
π fornecedor.nome,produto.nome,numUnidades (γ fornecedor.nome,produto.nome; sum(item.unidades)->numUnidades (((item⨝ numEnc=numero encomenda)⨝ codProd=codigo produto)⨝ fornecedor=nif fornecedor))
```


## ​Problema 5.3

### *a)*

```
π nome,numUtente paciente - π nome,numUtente (paciente⨝prescricao)
```

### *b)* 

```
π especialidade, numMedEsp (γ medico.especialidade; sum(num)->numMedEsp ((γ numMedico; count(numMedico) -> num prescricao)⨝ numMedico=numSNS medico))
```


### *c)* 

```
π nome, endereco, num ((γ farmacia; count(farmacia) -> num prescricao)⨝ farmacia=nome farmacia)

```


### *d)* 

```
π nome,formula,numRegFarm σ numRegFarm=906 ((π nome farmaco - π nomeFarmaco presc_farmaco)⨝farmaco)
```

### *e)* 

```
π farmacia,farmaceutica.nome,numFarm  (γ farmacia, numRegFarm; count(numRegFarm)->numFarm σ farmacia != null (presc_farmaco⨝ prescricao)⨝ numRegFarm=numReg  farmaceutica)
```

### *f)* 

```
π paciente.numUtente, paciente.nome σ num>1 ((γ numUtente; count(numMedico)->num (π numUtente,numMedico prescricao))⨝ prescricao.numUtente=paciente.numUtente paciente)
```
