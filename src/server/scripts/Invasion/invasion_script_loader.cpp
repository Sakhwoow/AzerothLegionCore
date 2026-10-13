/*
 * This file is part of the DestinyCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// This is where scripts' loading functions should be declared:

void AddSC_invasion_point_world_bosses();

void AddSC_InvasionAzsuna();
void AddSC_instance_InvasionAzsuna();

void AddSC_InvasionHM();
void AddSC_instance_invasion_HM();

void AddSC_InvasionStormheim();
void AddSC_instance_invasion_stormheim();

void AddSC_InvasionValshara();
void AddSC_instance_invasion_valshara();

void AddInvasionScripts()
{
    AddSC_invasion_point_world_bosses();

    AddSC_InvasionAzsuna();
    AddSC_instance_InvasionAzsuna();

    AddSC_InvasionHM();
    AddSC_instance_invasion_HM();

    AddSC_InvasionStormheim();
    AddSC_instance_invasion_stormheim();

    AddSC_InvasionValshara();
    AddSC_instance_invasion_valshara();
}
