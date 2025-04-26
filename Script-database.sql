
create table assortment (
	id serial primary key,
	MNN_active_substance varchar (500),
	drug_form varchar (500),
	dosage varchar (500),
	unit varchar (20),
	amount int,
	category_name varchar (500),
	assortment_type	varchar (20),
	forecast_costs decimal
);

create table non_drug_directory(
	id serial primary key,
	supply_code int,
	supply_type varchar(500),
	assortment_id int not null,
	foreign key(assortment_id) references assortment(id)
);

create table contracts (
	id serial primary key,
	contract_number varchar(100),
	sign_date date,
	contractor varchar(100),
	email varchar(100),
	delivery_date date
);

create table available (
	id serial primary key,
	commercial_name varchar (1000),
	pieces_per_pack int,
	unit_volume float,
	packs_amount float,
	price_per_unit decimal,
	batch varchar (100),
	expiration_date date,
	units_weight float,
	total_weigh float,
	assortment_id int,
	contract_id int,
	foreign key(assortment_id) references assortment (id),
	foreign key(contract_id) references contracts (id)
);

create table movement (
    id serial PRIMARY KEY,    
    type VARCHAR(10) CHECK(type IN ('incoming', 'writeoff')), -- incoming — приход, writeoff — расход
    amount INTEGER NOT null,
    movement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    contract_id INTEGER REFERENCES contracts(id),
    assortment_id INTEGER REFERENCES assortment(id),
    money_summ decimal
);

