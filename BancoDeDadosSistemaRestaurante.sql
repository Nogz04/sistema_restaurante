CREATE DATABASE SistemaRestaurante2;
USE SistemaRestaurante2;

CREATE TABLE Comida (

	  id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor DOUBLE NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(300),
    estado VARCHAR(14) 
    
);


CREATE TABLE Bebida (

	  id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor DOUBLE NOT NULL,
    quantidade INT NOT NULL,
    estado VARCHAR(14) 

);

CREATE TABLE Sobremesa (

	  id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor DOUBLE NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(300),
    estado VARCHAR(14) 

);


CREATE TABLE Mesa (

	id INT PRIMARY KEY AUTO_INCREMENT,
  numMesa INT NOT NULL UNIQUE
    
);

INSERT INTO MESA (numMesa ) VALUES (1);
INSERT INTO MESA (numMesa ) VALUES (2);
INSERT INTO MESA (numMesa ) VALUES (3);


CREATE TABLE Pedido (

	id INT PRIMARY KEY AUTO_INCREMENT,
  id_mesa INT,

	  quantidade_comida INT,
    quantidade_bebida INT, 
    quantidade_sobremesa INT,
    
	  valor_comida DOUBLE,
	  valor_bebida DOUBLE,
	  valor_sobremesa DOUBLE,

    id_comida INT,
    id_bebida INT,
    id_sobremesa INT,
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id),
    FOREIGN KEY (id_comida) REFERENCES Comida(id),
    FOREIGN KEY (id_bebida) REFERENCES Bebida(id),
    FOREIGN KEY (id_sobremesa) REFERENCES Sobremesa(id)
    
);

DELIMITER //

CREATE TRIGGER before_insert_pedido
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
    DECLARE comida_estado VARCHAR(14);
    DECLARE bebida_estado VARCHAR(14);
    DECLARE sobremesa_estado VARCHAR(14);

    -- Verifica o estado da comida
    IF NEW.id_comida IS NOT NULL THEN
        SELECT estado INTO comida_estado FROM Comida WHERE id = NEW.id_comida;
        IF comida_estado = 'Indisponivel' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: Comida desativada não pode ser adicionada ao pedido.';
        END IF;
    END IF;

    -- Verifica o estado da bebida
    IF NEW.id_bebida IS NOT NULL THEN
        SELECT estado INTO bebida_estado FROM Bebida WHERE id = NEW.id_bebida;
        IF bebida_estado = 'Indisponivel' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: Bebida desativada não pode ser adicionada ao pedido.';
        END IF;
    END IF;

    -- Verifica o estado da sobremesa
    IF NEW.id_sobremesa IS NOT NULL THEN
        SELECT estado INTO sobremesa_estado FROM Sobremesa WHERE id = NEW.id_sobremesa;
        IF sobremesa_estado = 'Indisponivel' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: Sobremesa desativada não pode ser adicionada ao pedido.';
        END IF;
    END IF;
    
END;

//
DELIMITER ;

DROP TRIGGER before_insert_pedido

SELECT * FROM COMIDA
