PROGRAM THE_BOSS

DOUBLE PRECISION FUM1,FUM2,FUM3,FUM4

REAL,ALLOCATABLE :: A(:,:),B(:),C(:)
PRINT*,"ENTER N"
READ*,N
ALLOCATE (A(N,N),B(N),C(N))
IF(N.EQ.0)THEN
	PRINT*,"NOT COOL!"
	GOTO 666
END IF

PRINT*,"ENTER THE MATRIX"
DO I=1,N
	READ(*,*)(A(I,J),J=1,N)
	PRINT*,(A(I,J),J=1,N)
END DO
PRINT*,"ENTER THE ANSWERS"
DO II=1,N
	READ(*,*)C(II)
END DO

DO Z=1,N-1
	IF(A(Z,Z).EQ.0)THEN
		DO W=1,N
			KK=A(Z,W)
			KKK=A(Z+1,W)
			A(Z,W)=KKK
			A(Z+1,W)=KK
		END DO
		UU=C(Z)
		UUU=C(Z+1)
		C(Z)=UUU
		C(Z+1)=UU
	END IF
	FUM2=A(Z,Z)
	DO J=Z+1,N
		IF(A(J,Z).NE.0)THEN
			FUM1=-A(J,Z)/FUM2
			DO K=1,N
				A(J,K)=A(J,K)+FUM1*A(Z,K)
			END DO
			C(J)=C(J)+FUM1*C(Z)
		END IF
	END DO
END DO

DO Z=N,2,-1
	IF(A(Z,Z).EQ.0)THEN
		DO W=1,N
			KK=A(Z,W)
			KKK=A(Z-1,W)
			A(Z,W)=KKK
			A(Z-1,W)=KK
		END DO
		UU=C(Z)
		UUU=C(Z-1)
		C(Z)=UUU
		C(Z-1)=UU
	END IF
	FUM3=A(Z,Z)
	DO J=Z-1,1,-1
		IF(A(J,Z).NE.0)THEN
			FUM4=-A(J,Z)/FUM3
			DO K=1,N
				A(J,K)=A(J,K)+FUM4*A(Z,K)
			END DO
			C(J)=C(J)+FUM4*C(Z)
		END IF
	END DO
END DO
PRINT*,"********************************"
DO F=1,N
	PRINT*,(A(F,JJ),JJ=1,N)
END DO
PRINT*,"********************************"
DO GGWP=1,N
	B(GGWP)=C(GGWP)/A(GGWP,GGWP)
	PRINT*,"X:",B(GGWP)
END DO

666 STOP
END